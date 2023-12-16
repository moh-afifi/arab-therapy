import 'package:dartz/dartz.dart';
import 'package:therapy/features/items/domain/entities/items_entity.dart';

abstract class ItemsRepository {
  Future<Either<String, ItemsEntity?>> getItems();
}
