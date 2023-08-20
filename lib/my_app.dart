import 'package:flutter/material.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'di/global_binding.dart';
import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      navigatorObservers: [GetXRouterObserver()],
      title: stringRes(R.appName),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
      locale: StringResources.locale,
      fallbackLocale: StringResources.fallbackLocale,
      translations: StringResources(),
    );
  }
}
