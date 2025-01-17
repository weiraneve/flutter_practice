import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/storage/storage.dart';

import 'common/config.dart';
import 'common/constants.dart';
import 'my_app.dart';

void startup() async {
  await initHive();
  await createBox(hiveTestBoxName);

  String env = const String.fromEnvironment(environment);
  await initConfig(env);

  runApp(const MyApp());
}
