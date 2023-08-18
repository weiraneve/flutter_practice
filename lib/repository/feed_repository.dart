import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_practice/model/feed_response.dart';
import 'package:flutter_practice/network/endpoint/feed_api.dart';

import '../common/logger.dart';
import '../network/client.dart';

class FeedRepository {
  final FeedApi _feedApi;

  FeedRepository({Dio? dio}) : _feedApi = FeedApi(dio ?? DioClient().dio);

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
