import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/string/strings.dart';

// ignore: non_constant_identifier_names
Widget LoadingPlaceholder() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: Get.theme.colorScheme.background,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text(stringRes(R.loading)),
      ],
    ),
  );
}
