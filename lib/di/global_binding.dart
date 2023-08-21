import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../network/animal/animal_api.dart';
import '../network/client.dart';
import '../network/feed/feed_api.dart';
import '../repository/animal_image_repository.dart';
import '../repository/feed_repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DioClient(), permanent: true);

    Get.lazyPut(() => FeedApi(findDio()), fenix: true);
    Get.lazyPut(() => FeedRepository(feedApi: findFeedApi()), fenix: true);
    Get.lazyPut(() => AnimalApi(findDio()), fenix: true);
    Get.lazyPut(() => AnimalImageRepository(animalApi: findAnimalApi()),
        fenix: true);
  }

  Dio findDio() => Get.find<DioClient>().dio;

  FeedApi findFeedApi() => Get.find();

  FeedRepository findFeedRepository() => Get.find();

  AnimalApi findAnimalApi() => Get.find();
}
