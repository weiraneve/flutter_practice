import 'package:flutter/material.dart';
import 'package:flutter_practice/res/theme/dimens.dart';
import 'package:get/get.dart';

import '../../res/string/strings.dart';

enum ErrorType {
  connection(
    title: R.connectionErrorTitle,
    subTitle: R.connectionErrorSubtitle,
    imageRes: 'assets/images/error_no_connection.png',
  ),
  loadingOrParsing(
    title: R.loadingOrParsingErrorTitle,
    subTitle: R.loadingOrParsingErrorSubtitle,
    imageRes: 'assets/images/error_loading_or_parsing.png',
  );

  const ErrorType({
    required this.title,
    required this.subTitle,
    required this.imageRes,
  });

  final R title;
  final R subTitle;
  final String imageRes;
}

const double _imageSize = Dimens.dp180;

// ignore: non_constant_identifier_names
Widget ErrorPlaceholder({
  ErrorType errorType = ErrorType.loadingOrParsing,
  required VoidCallback onRetry,
}) {
  final theme = Get.theme;
  return Container(
    width: double.infinity,
    height: double.infinity,
    color: theme.colorScheme.background,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          errorType.imageRes,
          width: _imageSize,
          height: _imageSize,
          color: theme.colorScheme.onBackground,
        ),
        const SizedBox(height: Dimens.dp16),
        Text(
          stringRes(errorType.title),
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.onBackground,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Dimens.dp8),
        Text(
          stringRes(errorType.subTitle),
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        const SizedBox(height: Dimens.dp16),
        FilledButton(
          onPressed: onRetry,
          child: Text(stringRes(R.retry)),
        ),
      ],
    ),
  );
}
