import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/pages/article/ui/article_page.dart';
import 'package:get/get_navigation/src/router_report.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

import '../pages/animal/page.dart';
import '../pages/count/page.dart';
import '../pages/feed/page.dart';
import '../pages/home_page.dart';
import '../pages/moments/page.dart';
import '../pages/timer/bloc/bloc.dart';
import '../pages/timer/view/timer_page.dart';

abstract class Routes {
  static const home = '/home';
  static const count = '/count';
  static const feed = '/feed';
  static const animal = '/animal';
  static const moments = '/moments';
  static const article = '/article';
  static const timer = '/timer';
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
      name: Routes.feed,
      page: () => const FeedListPage(),
    ),
    GetPage(
      name: Routes.animal,
      page: () => AnimalImagePage(),
    ),
    GetPage(
      name: Routes.moments,
      page: () => MomentsPage(),
    ),
    GetPage(
      name: Routes.article,
      page: () => const ArticlePage(),
    ),
    GetPage(
      name: Routes.timer,
      page: () => Provider<StopWatchBloc>(
        create: (context) => StopWatchBloc(),
        child: const TimerPage(),
      ),
    )
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
