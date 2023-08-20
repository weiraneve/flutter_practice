import 'async_load_controller.dart';
import 'data_controller.dart';

class AutoLoadController<T> extends AsyncLoadController<T> {
  AutoLoadController(DataController<T> dataController) : super(dataController);

  @override
  void onInit() {
    super.onInit();
    load();
  }
}
