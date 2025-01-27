import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<ProductDataModel>>> getProducts();
}
