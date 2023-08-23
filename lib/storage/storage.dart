import 'package:hive_flutter/hive_flutter.dart';

abstract class Storage {
  void setItem({required String key, required String value});

  Future<String?> getItem({required String key});

  Future<Map<String, String>?> getAllItem();

  void deleteItem({required String key});

  void clear();
}

Future<void> initHive() {
  return Hive.initFlutter();
}

Future<void> createBox(String boxName) {
  return Hive.openBox(boxName);
}
