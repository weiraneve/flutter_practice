import '../../../network/moments/model/tweet.dart';

class TweetCache {
  static const int _EXPIRE_INTERVAL = 5 * 60 * 1000; // 5 minutes

  int _expireTime = 0;
  List<Tweet>? _tweets;

  List<Tweet>? get tweets => _tweets;

  void saveCache(List<Tweet> tweetList) {
    _tweets = tweetList;
    _expireTime = DateTime.now().millisecondsSinceEpoch + _EXPIRE_INTERVAL;
  }

  bool isCacheAvailable() {
    return _tweets != null &&
        DateTime.now().millisecondsSinceEpoch < _expireTime;
  }
}
