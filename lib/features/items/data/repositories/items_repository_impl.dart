import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:therapy/features/items/data/models/items_model.dart';

import '../../domain/repositories/items_repository.dart';
import '../data_sources/items_remote_data_source.dart';

@Injectable(as: ItemsRepository)
class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRepositoryImpl({
    required this.itemsRemoteDataSource,
  });

  final ItemsRemoteDataSource itemsRemoteDataSource;

  @override
  Future<Either<String, ItemsModel?>> getItems() async {
    try {
      final response = await itemsRemoteDataSource.getItems();

      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
