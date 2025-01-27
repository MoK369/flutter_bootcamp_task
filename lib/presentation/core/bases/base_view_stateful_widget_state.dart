import 'package:flutter/material.dart';

abstract class BaseViewStatefulWidgetState<W extends StatefulWidget>
    extends State<W> {
  late ThemeData theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }
}
