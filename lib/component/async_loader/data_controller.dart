import 'package:get/get.dart';

abstract class DataController<T> extends GetxController {
  late Rx<T> dataRx;

  T get data => dataRx.value;

  set data(T value) => dataRx.value = value;

  Future<T> fetch();
}
