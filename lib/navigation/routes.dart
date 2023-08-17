import 'package:flutter/cupertino.dart';

import '../ui/count_page.dart';
import '../ui/feed_list_page.dart';
import '../ui/home_page.dart';
import '../ui/other_page.dart';

class Routes {
  const Routes._();

  static const String home = '/home';
  static const String count = '/count';
  static const String other = '/other';
  static const String feed = '/feed';

  static Map<String, WidgetBuilder> all = {
    home: (context) => const HomePage(),
    count: (context) => const CountPage(),
    other: (context) => const OtherPage(),
    feed: (context) => const FeedListPage(),
  };
}
