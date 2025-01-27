import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_task/presentation/core/bases/base_view_stateless_widget.dart';

class LoadingStateWidget extends BaseViewStatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget customBuild(BuildContext context,ThemeData theme) {
    return Center(
          child: CircularProgressIndicator(),
        );
  }
}
