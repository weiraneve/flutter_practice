import 'package:flutter_practice/pages/moments/tweet/cache.dart';
import 'package:get/get.dart';

import '../../../network/moments/api.dart';
import '../../../network/moments/model/tweet.dart';

class TweetRepository {
  final MomentsApi _momentsApi;
  final _tweetCache = TweetCache();

  TweetRepository({MomentsApi? momentsApi})
      : _momentsApi = momentsApi ?? Get.find();

  Future<List<Tweet>> getTweets(int startIndex, int count) async {
    final List<Tweet> tweetList;
    if (_tweetCache.isCacheAvailable()) {
      tweetList = _tweetCache.tweets!;
    } else {
      final tweetsFromNet = await _momentsApi.getTweets();
      final filteredList = _filterTweetList(tweetsFromNet);
      _tweetCache.saveCache(filteredList);
      tweetList = filteredList;
    }
    return _cutTweetsList(startIndex, count, tweetList);
  }

  List<Tweet> _filterTweetList(List<Tweet> tweetList) {
    final filteredList = <Tweet>[];
    for (final tweet in tweetList) {
      if (tweet.sender != null &&
          (tweet.content?.isNotEmpty == true ||
              tweet.images?.isNotEmpty == true)) {
        filteredList.add(tweet);
      }
    }
    return filteredList;
  }

  List<Tweet> _cutTweetsList(
      int startIndex, int count, List<Tweet> tweetList) {
    var endIndex = startIndex + count;
    if (endIndex >= tweetList.length) {
      endIndex = tweetList.length;
    }
    return tweetList.sublist(startIndex, endIndex);
  }
}
