import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



enum APIMethod { post, put, get, delete, patch }

@lazySingleton
class ApiHandler {

  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );

  late Dio _dio;
  bool allRequestSent = false;
  String? _userToken;
  String? _lang;

  static const _kLang = 'EN';

  void setLang(String lang) => _lang = lang;

  void setUserToken(String? accessToken) => _userToken = accessToken;

  String get unAuthorized => "Unauthorized";

  String get httpException => "Server Error";

  String get formatException => "Format Exception";

  String get socketException => "No internet Connection";

  String get cancelException => "Request Canceled";

  String get notFound => "API Not found";

  void _onSendProgress(int count, int total) {
    if (kDebugMode) {
      if (count == total) {
        allRequestSent = true;
        log('Request progress Done 100%');
      } else {
        log('Request progress : ${(count / total).toStringAsFixed(2)} %');
      }
    }
  }

  dynamic _validateAndReturnResponse(Response response, String route) {
    if (response.data != null) {

      return response.data;
    } else {

      throw DioException(
        requestOptions: RequestOptions(path: route),
        type: DioExceptionType.badResponse,
        response: Response<APIError>(
          data: APIError(
            message: response.data['message'] ??
                response.statusMessage ??
                formatException,
            code: -1,
          ),
          statusCode: 999,
          requestOptions: RequestOptions(path: route),
        ),
      );
    }
  }

  Future<dynamic> call({
    required String path,
    required APIMethod method,
    int apiVersion = 1,
    Map<String, dynamic>? body,
    FormData? formData,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    int? connectTimeout,
    Function(int? count, int? total)? onSendProgress,
    Function(int? count, int? total)? onReceiveProgress,
  }) async {
    try {
      allRequestSent = false;

      final baseUrl = 'https://api.slingacademy.com/v1/sample-data/$path';
      headers ??= {
        "Accept-Language": _lang ?? _kLang,
        "accept": "application/json",
        if (_userToken != null) "Authorization": 'Token $_userToken',
        if (method != APIMethod.get || method != APIMethod.delete)
          'Content-Type': 'application/json',
      };
      _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 60),
          headers: headers,
        ),
      );

      if (kDebugMode) {
        _dio.interceptors.add(_logger);
      }

      Response response;

      switch (method) {
        case APIMethod.post:
          response = await _dio.post(
            baseUrl,
            data: formData ?? body ?? {},
            onSendProgress: onSendProgress ?? _onSendProgress,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
          );
          break;
        case APIMethod.put:
          response = await _dio.put(
            baseUrl,
            data: formData ?? body ?? {},
            onSendProgress: onSendProgress ?? _onSendProgress,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
          );
          break;
        case APIMethod.get:
          response = await _dio.get(
            baseUrl,
            onReceiveProgress: onReceiveProgress,
            cancelToken: cancelToken,
            data: formData ?? body ?? {},
          );
          break;
        case APIMethod.delete:
          response = await _dio.delete(
            baseUrl,
            data: formData ?? body ?? {},
            cancelToken: cancelToken,
          );
          break;
        case APIMethod.patch:
          response = await _dio.patch(
            baseUrl,
            data: formData ?? body ?? {},
            options: Options(headers: headers),
          );
          break;
      }
      return _validateAndReturnResponse(response, path);
    } on FormatException catch (formatError) {
      throw '$httpException : ${formatError.message}';
    } on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.badResponse:
          throw await _handleAPIError(
            APIError(
              code: dioError.response!.statusCode,
              message: dioError.response!.data!['message'],
            ),
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.cancel:
          throw httpException;
        case DioExceptionType.connectionError:
          throw socketException;
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.unknown:
          if (dioError.error.toString().contains('FormatException')) {
            throw httpException;
          }
          throw socketException;
        default:
          throw formatException;
      }
    }
  }

  Future<String> _handleAPIError(APIError error) async {
    String? errorMsg = error.message;
    if (error.code! == 401 || error.code! == 403) {
      return errorMsg ?? unAuthorized;
    } else if (error.code! == 404) {
      return errorMsg ?? notFound;
    } else if (error.code! >= 500) {
      return errorMsg ?? httpException;
    } else {
      return errorMsg ?? formatException;
    }
  }
}

class APIError {
  final String? message;
  final int? code;

  APIError({
    this.message,
    this.code,
  });
}
