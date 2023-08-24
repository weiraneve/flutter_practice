import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import 'model/tweet.dart';
import 'model/user.dart';

part 'api.g.dart';

@RestApi()
abstract class MomentsApi {
  factory MomentsApi(Dio dio) =>
      _MomentsApi(dio, baseUrl: Env[baseUrlMoments]);

  @GET('user.json')
  Future<User> getUser();

  @GET('tweets.json')
  Future<List<Tweet>> getTweets();
}
