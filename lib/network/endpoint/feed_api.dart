import 'package:dio/dio.dart';
import 'package:flutter_practice/common/constants.dart';
import "package:retrofit/retrofit.dart";

import '../../common/config.dart';
import '../../model/feed_response.dart';

part 'feed_api.g.dart';

@RestApi()
abstract class FeedApi {
  factory FeedApi(Dio dio) => _FeedApi(dio, baseUrl: Env[baseUrl]);

  @GET('friend/json')
  Future<FeedResponse> getFeed([@CancelRequest() CancelToken? cancelToken]);
}
