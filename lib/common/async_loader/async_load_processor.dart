import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../res/string/strings.dart';
import 'async_load_controller.dart';
import 'error_placeholder.dart';
import 'load_state.dart';
import 'loading_placeholder.dart';

Widget _errorView(Object error, VoidCallback onRetry) {
  return ErrorPlaceholder(
    errorType: error is Exception
        ? ErrorType.connection
        : ErrorType.loadingOrParsing,
    onRetry: onRetry,
  );
}

void _showErrorAlert(Object error) {
  final type = error is Exception
      ? ErrorType.connection
      : ErrorType.loadingOrParsing;
  Get.snackbar(stringRes(type.title), stringRes(type.subTitle));
}

// ignore: non_constant_identifier_names
Widget AsyncLoadProcessor<T>(
  AsyncLoadController<T> asyncLoadController, {
  bool showLoadingInReload = true,
  Widget? loadingView,
  Widget Function(Object error, VoidCallback onRetry) errorView = _errorView,
  Function(Object error) showErrorAlert = _showErrorAlert,
  required Widget Function(T data) content,
}) {
  final nonNullLoadingView = loadingView ?? LoadingPlaceholder();
  return Builder(
    builder: (context) {
      return Obx(() {
        final loadState = asyncLoadController.loadState();
        if (loadState is Loading<T>) {
          final data = loadState.data;
          if (data == null) {
            return nonNullLoadingView;
          } else {
            // reload
            if (showLoadingInReload) {
              return nonNullLoadingView;
            } else {
              return content(data);
            }
          }
        } else if (loadState is Success<T>) {
          return content(loadState.data);
        } else if (loadState is Failure<T>) {
          final data = loadState.data;
          if (data == null) {
            return errorView(loadState.error, () {
              asyncLoadController.load();
            });
          } else {
            showErrorAlert(loadState.error);
            return content(data);
          }
        } else {
          return Container();
        }
      });
    },
  );
}
