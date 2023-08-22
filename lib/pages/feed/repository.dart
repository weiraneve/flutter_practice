import 'dart:async';

import 'package:get/get.dart';

import '../../common/logger.dart';
import '../../network/feed/feed_api.dart';
import '../../network/feed/model/feed_response.dart';

class FeedRepository {
  final FeedApi _feedApi;

  FeedRepository({FeedApi? feedApi}) : _feedApi = feedApi ?? Get.find();

  Future<FeedResponse> getFeed() => _feedApi.getFeed();

  Future<List<FeedModel>> getFeedModels() async {
    try {
      FeedResponse feedResponse = await getFeed();
      return feedResponse.data;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
