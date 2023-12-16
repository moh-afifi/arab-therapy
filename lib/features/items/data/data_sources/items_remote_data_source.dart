import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:therapy/features/items/data/models/items_model.dart';

import '../../../../core/utils/api_handler.dart';

abstract class ItemsRemoteDataSource {
  Future<ItemsModel?> getItems();
}

@Injectable(as: ItemsRemoteDataSource)
class ItemsRemoteDataSourceImpl extends ItemsRemoteDataSource {
  final ApiHandler apiHandler;

  ItemsRemoteDataSourceImpl({required this.apiHandler});

  @override
  Future<ItemsModel?> getItems() async {
    try {
      final response = await apiHandler(
        path: 'photos',
        method: APIMethod.get,
      );
      return compute<Map<String, dynamic>, ItemsModel>(
        ItemsModel.fromJson,
        response,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
