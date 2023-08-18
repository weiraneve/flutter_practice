import 'dart:async';

import 'package:flutter_practice/model/feed_response.dart';
import 'package:flutter_practice/network/endpoint/feed_api.dart';
import 'package:get/get.dart';

import '../common/logger.dart';

class FeedRepository {
  final FeedApi _feedApi;

  FeedRepository({FeedApi? feedApi})
      : _feedApi = feedApi ?? Get.find();

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
