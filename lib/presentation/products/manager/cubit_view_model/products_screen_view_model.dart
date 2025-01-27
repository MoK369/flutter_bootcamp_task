import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_task/domain/api_result/api_result.dart';
import 'package:flutter_bootcamp_task/domain/models/products/product_data_model.dart';
import 'package:flutter_bootcamp_task/domain/use_cases/products/get_products_use_case.dart';
import 'package:flutter_bootcamp_task/presentation/products/manager/cubit_view_model/products_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsScreenViewModel extends Cubit<ProductsState> {
  GetProductsUseCase getProductsUseCase;
  ProductsScreenViewModel(
      {required this.getProductsUseCase})
      : super(ProductsLoadingState());

  void loadProducts() async {
    emit(ProductsLoadingState());
    var useCaseResult = await getProductsUseCase.invoke();
    switch (useCaseResult) {
      case Success<List<ProductDataModel>>():
        emit(ProductsSuccessState(products: useCaseResult.data));
      case ServerError<List<ProductDataModel>>():
        emit(ProductsErrorState(exception: useCaseResult.serverErrorException));
      case CodeError<List<ProductDataModel>>():
        emit(ProductsErrorState(exception: useCaseResult.exception));
    }
  }

}
