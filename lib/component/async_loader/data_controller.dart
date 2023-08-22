import 'package:get/get.dart';

abstract class DataController<T> extends GetxController {
  late Rx<T> data;

  Future<T> fetch();
}
