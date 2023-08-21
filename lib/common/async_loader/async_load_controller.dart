import 'package:get/get.dart';

import '../logger.dart';
import 'data_controller.dart';
import 'load_state.dart';

class AsyncLoadController<T> extends GetxController {
  final DataController<T> _dataController;

  final loadState = Rx<LoadState<T>>(Idle<T>());
  T? _data;

  AsyncLoadController(this._dataController);

  void load() async {
    loadState.value = Loading<T>(_data);
    try {
      final data = await _dataController.fetch();
      _data = data;
      _dataController.data = data;
      loadState.value = Success<T>(data);
    } catch (e) {
      logger.e(_errorLoadMessage, e);
      loadState.value = Failure<T>(_data, e);
    }
  }

  void reset() {
    loadState.value = Idle<T>();
    _data = null;
  }
}

const _errorLoadMessage = '[AsyncLoadViewModel] there is an error in fetcher';
