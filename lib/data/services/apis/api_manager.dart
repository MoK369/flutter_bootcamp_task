import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bootcamp_task/data/models/products/product_data_model_dto.dart';
import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/custom_exceptions/server_error/server_error_exception.dart';
import 'package:flutter_bootcamp_task/domain/extension_methods/int_extension_methods/http_status_code.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static const String baseUrl = "https://fakestoreapi.com";
  final Dio _dio = Dio();

  ApiManager() {
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
  }

  Future<ApiResult<List<ProductDataModelDto>>> getProducts() async {
    try {
      final response = await _dio.get(baseUrl + EndPoints.productsEndPoint);
      if (response.statusCode?.isSuccessHttpCall() ?? false) {
        List<ProductDataModelDto> productResponse =
            _getProductResponse(response.data);

        return Success(data: productResponse);
      } else {
        return ServerError(
            serverErrorException: ServerErrorException(
                statusCode: "${response.statusCode ?? ""}",
                statusMessage: response.statusMessage ?? ""));
      }
    } on Exception catch (e) {
      return CodeError(exception: e);
    }
  }

  List<ProductDataModelDto> _getProductResponse(dynamic data) {
    List<ProductDataModelDto> resultList = [];
    for (var jsonItem in data) {
      resultList.add(ProductDataModelDto.fromJson(jsonItem));
    }
    return resultList;
  }
}

class EndPoints {
  static const productsEndPoint = "/products";
}
