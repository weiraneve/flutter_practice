import "package:flutter_practice/common/constants.dart";
import "package:hive/hive.dart";
import "package:hive_flutter/hive_flutter.dart";

import "storage.dart";

class LocalStorage implements Storage {
  Box? box;

  LocalStorage({String? boxName}) {
    box = Hive.box(boxName ?? hiveTestBoxName);
  }

  @override
  void setItem({required String key, required String value}) async {
    await box?.put(key, value);
  }

  @override
  void clear() {
    box?.clear();
  }

  @override
  void deleteItem({required String key}) {
    box?.delete(key);
  }

  @override
  Future<Map<String, String>?> getAllItem() {
    return Future.value(box?.toMap() as Map<String, String>);
  }

  @override
  Future<String?> getItem({required String key}) async {
    return await box?.get(key);
  }
}
