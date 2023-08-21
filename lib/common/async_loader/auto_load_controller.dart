import 'async_load_controller.dart';

class AutoLoadController<T> extends AsyncLoadController<T> {
  AutoLoadController(super.dataController);

  @override
  void onInit() {
    super.onInit();
    load();
  }
}
