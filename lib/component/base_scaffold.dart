import 'package:flutter/material.dart';

import '../res/string/strings.dart';
import 'base_app_bar.dart';

// ignore: non_constant_identifier_names
Widget BaseScaffold({
  String? title,
  PreferredSizeWidget? appBar,
  Widget? drawer,
  required Widget body,
  Widget? floatingActionButton,
}) {
  return Scaffold(
    appBar: appBar ?? BaseAppBar(title ?? stringRes(R.appName)),
    drawer: drawer,
    body: body,
    floatingActionButton: floatingActionButton,
  );
}
