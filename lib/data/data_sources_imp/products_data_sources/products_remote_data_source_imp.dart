import 'package:flutter_bootcamp_task/data/data_sources/products_data_sources/products_remote_data_source.dart';
import 'package:flutter_bootcamp_task/data/models/products/product_data_model_dto.dart';
import 'package:flutter_bootcamp_task/data/services/apis/api_manager.dart';
import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImp implements ProductsRemoteDataSource {
  ApiManager apiManager;
  ProductsRemoteDataSourceImp({required this.apiManager});

  @override
  Future<ApiResult<List<ProductDataModel>>> getProducts() async {
    var apiResult = await apiManager.getProducts();
    switch (apiResult) {
      case Success<List<ProductDataModelDto>>():
        var convertedList = apiResult.data.map<ProductDataModel>(
          (productDto) {
            return productDto.convertToProductDataModel();
          },
        ).toList();
        return Success(data: convertedList);
      case ServerError<List<ProductDataModelDto>>():
        return ServerError(
            serverErrorException: apiResult.serverErrorException);
      case CodeError<List<ProductDataModelDto>>():
        return CodeError(exception: apiResult.exception);
    }
  }
}
