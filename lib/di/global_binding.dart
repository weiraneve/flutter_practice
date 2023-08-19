import 'package:dio/dio.dart';
import 'package:flutter_practice/network/endpoint/feed_api.dart';
import 'package:flutter_practice/ui/feed/feed_list_page_provider.dart';
import 'package:get/get.dart';

import '../network/client.dart';
import '../repository/feed_repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioClient(), permanent: true);

    Get.lazyPut(() => FeedApi(findDio()), fenix: true);
    Get.lazyPut(() => FeedRepository(feedApi: findFeedApi()), fenix: true);
    Get.lazyPut(
        () => FeedListPageProvider(feedRepository: findFeedRepository()),
        fenix: true);
  }

  Dio findDio() => Get.find<DioClient>().dio;

  FeedApi findFeedApi() => Get.find<FeedApi>();

  FeedRepository findFeedRepository() => Get.find<FeedRepository>();
}
