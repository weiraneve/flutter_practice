import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../network/animal/api.dart';
import '../network/client.dart';
import '../network/feed/api.dart';
import '../network/moments/api.dart';
import '../pages/animal/repository.dart';
import '../pages/feed/repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioClient(), permanent: true);
    Get.lazyPut(() => FeedApi(findDio()), fenix: true);
    Get.lazyPut(() => FeedRepository(feedApi: findFeedApi()), fenix: true);
    Get.lazyPut(() => AnimalApi(findDio()), fenix: true);
    Get.lazyPut(() => AnimalImageRepository(animalApi: findAnimalApi()),
        fenix: true);
    Get.lazyPut(() => MomentsApi(findDio()), fenix: true);
  }

  Dio findDio() => Get.find<DioClient>().dio;

  FeedApi findFeedApi() => Get.find();

  FeedRepository findFeedRepository() => Get.find();

  AnimalApi findAnimalApi() => Get.find();
}
