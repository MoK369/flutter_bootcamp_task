import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_task/di.dart';
import 'package:flutter_bootcamp_task/presentation/core/widgets/custom_pull_down_refresh_indicator.dart';
import 'package:flutter_bootcamp_task/presentation/core/widgets/error_state_widget.dart';
import 'package:flutter_bootcamp_task/presentation/core/widgets/loading_state_widget.dart';
import 'package:flutter_bootcamp_task/presentation/products/manager/cubit_view_model/products_state.dart';
import 'package:flutter_bootcamp_task/presentation/products/manager/cubit_view_model/products_screen_view_model.dart';
import 'package:flutter_bootcamp_task/presentation/products/widgets/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => ProductsScreenState();
}

class ProductsScreenState extends State<ProductsScreen>
{
  late ProductsScreenViewModel productsViewModel;
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    productsViewModel = getIt.get<ProductsScreenViewModel>();
    productsViewModel.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        onPopInvoked(didPop, result);
      },
      child: BlocProvider(
        create: (context) => productsViewModel,
        child: Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            toolbarHeight: 50.h,
            title: Image.asset(
              "assets/icons/app_bar_icon.png",
              height: 35.h,
              width: 85.w,
            ),
          ),
          body: CustomPullDownRefreshIndicator(
            onRefresh: () {
              productsViewModel.loadProducts();
            },
            child: RPadding(
              padding: const EdgeInsets.all(8),
              child: BlocBuilder<ProductsScreenViewModel, ProductsState>(
                builder: (context, state) {
                  switch (state) {
                    case ProductsLoadingState():
                      return const LoadingStateWidget();

                    case ProductsSuccessState():
                      var products = state.products;
                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h),
                        itemBuilder: (context, index) {
                          return ProductCard(product: products[index]);
                        },
                      );

                    case ProductsErrorState():
                      return CustomScrollView(slivers: [
                        SliverFillRemaining(
                            child: ErrorStateWidget(exception: state.exception))
                      ]);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPopInvoked(bool didPop, Object? result) {
    DateTime now = DateTime.now();
    bool isWarning = (lastPressed == null) ||
        (now.difference(lastPressed!) > const Duration(seconds: 2));
    if (isWarning) {
      lastPressed = DateTime.now();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Press back again to exit"),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        duration: Duration(seconds: 2),
      ));
      return;
    }
    SystemNavigator.pop();
    lastPressed = null;
  }
}
