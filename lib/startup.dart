import 'package:flutter/cupertino.dart';

import 'common/config.dart';
import 'my_app.dart';

void startup() async {
  String env = const String.fromEnvironment("ENV", defaultValue: "local");
  await initConfig(env);

  runApp(const MyApp());
}
