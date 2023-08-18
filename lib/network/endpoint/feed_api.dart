import 'package:dio/dio.dart';
import "package:retrofit/retrofit.dart";

import '../../model/feed_response.dart';

part 'feed_api.g.dart';

@RestApi()
abstract class FeedApi {
  factory FeedApi(Dio dio) = _FeedApi;

  @GET('friend/json')
  Future<FeedResponse> getFeed([@CancelRequest() CancelToken? cancelToken]);
}
