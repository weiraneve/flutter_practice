import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/string/strings.dart';
import 'async_load_controller.dart';
import 'error_placeholder.dart';
import 'load_state.dart';
import 'loading_placeholder.dart';

Widget _errorView(Object error, VoidCallback onRetry) {
  return ErrorPlaceholder(
    errorType:
        error is Exception ? ErrorType.connection : ErrorType.loadingOrParsing,
    onRetry: onRetry,
  );
}

void _showErrorAlert(Object error) {
  final type =
      error is Exception ? ErrorType.connection : ErrorType.loadingOrParsing;
  Get.snackbar(stringRes(type.title), stringRes(type.subTitle));
}

// ignore: non_constant_identifier_names
Widget AsyncLoadProcessor<T>(
  AsyncLoadController<T> asyncLoadController, {
  bool showLoadingInReload = true,
  bool useRefresh = true,
  Widget? loadingView,
  Widget Function(Object error, VoidCallback onRetry) errorView = _errorView,
  Function(Object error) showErrorAlert = _showErrorAlert,
  required Widget Function(T data) content,
}) {
  final nonNullLoadingView = loadingView ?? LoadingPlaceholder();

  Widget buildContent(BuildContext context) {
    return Obx(() {
      final loadState = asyncLoadController.loadState();
      switch (loadState) {
        case Loading():
          final data = loadState.data;
          if (data != null && !showLoadingInReload) {
            return content(data);
          } else {
            return nonNullLoadingView;
          }
        case Success():
          return content(loadState.data);
        case Failure():
          final data = loadState.data;
          if (data == null) {
            return errorView(loadState.error, () {
              asyncLoadController.load();
            });
          } else {
            showErrorAlert(loadState.error);
            return content(data);
          }
        default:
          return Container();
      }
    });
  }

  return Builder(
    builder: (context) {
      if (useRefresh) {
        return RefreshIndicator(
          onRefresh: asyncLoadController.refresh,
          child: buildContent(context),
        );
      } else {
        return buildContent(context);
      }
    },
  );
}
