// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/items/data/data_sources/items_remote_data_source.dart'
    as _i4;
import '../../features/items/data/repositories/items_repository_impl.dart'
    as _i6;
import '../../features/items/domain/repositories/items_repository.dart' as _i5;
import '../../features/items/domain/use_cases/get_items_use_case.dart' as _i7;
import 'api_handler.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiHandler>(() => _i3.ApiHandler());
    gh.factory<_i4.ItemsRemoteDataSource>(
        () => _i4.ItemsRemoteDataSourceImpl(apiHandler: gh<_i3.ApiHandler>()));
    gh.factory<_i5.ItemsRepository>(() => _i6.ItemsRepositoryImpl(
        itemsRemoteDataSource: gh<_i4.ItemsRemoteDataSource>()));
    gh.factory<_i7.GetItemsUseCase>(
        () => _i7.GetItemsUseCase(itemsRepository: gh<_i5.ItemsRepository>()));
    return this;
  }
}
