import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';
import 'package:flutter_bootcamp_task/domain/respositories/products/products_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  ProductsRepository productsRepository;
  GetProductsUseCase({required this.productsRepository});

  Future<ApiResult<List<ProductDataModel>>> invoke(){
    return productsRepository.getProducts();
  }
}