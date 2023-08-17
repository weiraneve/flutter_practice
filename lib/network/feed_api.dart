import 'package:dio/dio.dart';

import '../model/feed_list_entity.dart';

final dio = Dio();

Future<FeedListEntity> fetchFeedList() async {
  try {
    final response = await dio.get('https://www.wanandroid.com/friend/json');
    return FeedListEntity.fromJson(response.data);
  } catch (error) {
    throw Exception('Failed to load feed list: $error');
  }
}
