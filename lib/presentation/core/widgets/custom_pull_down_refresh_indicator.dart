import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPullDownRefreshIndicator extends StatelessWidget {
  final Widget child;
  final void Function() onRefresh;
  const CustomPullDownRefreshIndicator(
      {super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
        backgroundColor: Colors.white,
        durations: const RefreshIndicatorDurations(
            completeDuration: Duration(microseconds: 500)),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          onRefresh();
        },
        indicatorBuilder: (context, controller) {
          return Lottie.asset(
              "assets/animations/categories_loading_indicator.json");
        },
        child: child);
  }
}
