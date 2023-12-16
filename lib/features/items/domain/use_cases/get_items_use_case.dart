import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/usecases.dart';
import '../entities/items_entity.dart';
import '../repositories/items_repository.dart';

@injectable
class GetItemsUseCase extends UseCase<ItemsEntity?, NoParams> {
  final ItemsRepository itemsRepository;

  GetItemsUseCase({
    required this.itemsRepository,
  });

  @override
  Future<Either<String, ItemsEntity?>> call(NoParams params) async => await itemsRepository.getItems();
}
