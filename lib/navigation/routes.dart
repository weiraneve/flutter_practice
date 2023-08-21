import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/router_report.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/animal/animal_image_page.dart';
import '../pages/count/count_page.dart';
import '../pages/feed/feed_list_page.dart';
import '../pages/home_page.dart';
import '../pages/other_page.dart';

abstract class Routes {
  static const home = '/home';
  static const count = '/count';
  static const other = '/other';
  static const feed = '/feed';
  static const animal = '/animal';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.count,
      page: () => CountPage(),
    ),
    GetPage(
      name: Routes.other,
      page: () => const OtherPage(),
    ),
    GetPage(
      name: Routes.feed,
      page: () => const FeedListPage(),
    ),
    GetPage(
      name: Routes.animal,
      page: () => AnimalImagePage(),
    ),
  ];
}

class GetXRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    RouterReportManager.reportCurrentRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    RouterReportManager.reportRouteDispose(route);
  }
}
