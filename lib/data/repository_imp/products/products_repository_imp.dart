import 'package:flutter_bootcamp_task/data/data_sources/products_data_sources/products_remote_data_source.dart';
import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';
import 'package:flutter_bootcamp_task/domain/respositories/products/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepository)
class ProductsRepositoryImp implements ProductsRepository {
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImp({required this.productsRemoteDataSource});

  @override
  Future<ApiResult<List<ProductDataModel>>> getProducts() {
    return productsRemoteDataSource.getProducts();
  }
}
