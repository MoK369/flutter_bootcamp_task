import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';

sealed class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  List<ProductDataModel> products;
  ProductsSuccessState({required this.products});
}

class ProductsErrorState extends ProductsState {
  Exception exception;
  ProductsErrorState({required this.exception});
}
