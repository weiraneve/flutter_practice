import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_practice/storage/storage.dart';
import 'package:flutter_ume/core/plugin_manager.dart';
import 'package:flutter_ume/core/ui/root_widget.dart';
import 'package:flutter_ume_kit_dio_plus/flutter_ume_kit_dio_plus.dart';
import 'package:get/get.dart';

import 'common/config.dart';
import 'common/constants.dart';
import 'my_app.dart';
import 'network/client.dart';

void startup() async {
  await initHive();
  await createBox(hiveTestBoxName);

  String env = const String.fromEnvironment(environment);
  await initConfig(env);

  Get.lazyPut(() => DioClient());

  if (kDebugMode) {
    PluginManager.instance
        .register(DioInspector(dio: Get.put(Get.find<DioClient>().dio)));
    runApp(const UMEWidget(enable: true, child: MyApp()));
  } else {
    runApp(const MyApp());
  }
}
