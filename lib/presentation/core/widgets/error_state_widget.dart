import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_task/presentation/core/api_error_message/api_error_message.dart';
import 'package:flutter_bootcamp_task/presentation/core/bases/base_view_stateless_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorStateWidget extends BaseViewStatelessWidget {
  final Exception exception;
  const ErrorStateWidget({super.key, required this.exception});

  @override
  Widget customBuild(BuildContext context, ThemeData theme) {
    return Center(
          child: Text(
    ApiErrorMessage.getErrorMessage(exception: exception),
    style: theme.textTheme.labelLarge!.copyWith(fontSize: 18.sp),
          ),
        );
  }
}
