// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/data_sources/products_data_sources/products_remote_data_source.dart'
    as _i275;
import 'data/data_sources_imp/products_data_sources/products_remote_data_source_imp.dart'
    as _i481;
import 'data/repository_imp/products/products_repository_imp.dart' as _i760;
import 'data/services/apis/api_manager.dart' as _i265;
import 'domain/respositories/products/products_repository.dart' as _i206;
import 'domain/use_cases/products/get_products_use_case.dart' as _i114;
import 'presentation/products/manager/products_view_model.dart' as _i499;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i265.ApiManager>(() => _i265.ApiManager());
    gh.factory<_i275.ProductsRemoteDataSource>(() =>
        _i481.ProductsRemoteDataSourceImp(apiManager: gh<_i265.ApiManager>()));
    gh.factory<_i206.ProductsRepository>(() => _i760.ProductsRepositoryImp(
        productsRemoteDataSource: gh<_i275.ProductsRemoteDataSource>()));
    gh.factory<_i114.GetProductsUseCase>(() => _i114.GetProductsUseCase(
        productsRepository: gh<_i206.ProductsRepository>()));
    gh.factory<_i499.ProductsViewModel>(() => _i499.ProductsViewModel(
        getProductsUseCase: gh<_i114.GetProductsUseCase>()));
    return this;
  }
}
