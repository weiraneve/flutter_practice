import 'package:get/get.dart';

abstract class DataController<T> extends GetxController {
  late T data;

  Future<T> fetch();
}
