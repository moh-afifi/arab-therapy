import 'package:flutter/material.dart';
import 'package:therapy/core/utils/usecases.dart';
import 'package:therapy/features/items/domain/entities/items_entity.dart';


import '../../../../core/utils/service_locator.dart';
import '../../domain/use_cases/get_items_use_case.dart';

class ItemsProvider extends ChangeNotifier {
  ItemsProvider(){
    getItems();
  }
  final GetItemsUseCase _getItemsUseCase = sl<GetItemsUseCase>();
  bool _loading = false;

  bool get loading => _loading;

  String? _error;

  String? get error => _error;

  ItemsEntity? _items;

  ItemsEntity? get items => _items;

  _changeLoading(bool isLoading) {
    _loading = isLoading;
    notifyListeners();
  }

  _changeError(String? errorMessage) {
    _error = errorMessage;
    notifyListeners();
  }

  Future<void> getItems() async {
    _changeLoading(true);
    _changeError(null);
    final response = await _getItemsUseCase(const NoParams());

    response.fold(
      (error) {
        _changeError(error);
      },
      (weather) {
        _items = weather;
        notifyListeners();
      },
    );
    _changeLoading(false);
  }

}
