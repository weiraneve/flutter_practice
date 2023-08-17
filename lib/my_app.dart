import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/count_page.dart';
import 'package:flutter_practice/ui/home_page.dart';
import 'package:flutter_practice/ui/other_page.dart';

import 'navigation/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.count: (context) => const CountPage(),
        Routes.other: (context) => const OtherPage(),
      },
    );
  }
}

const _appTitle = 'flutter practice';
