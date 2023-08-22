import 'package:flutter_practice/pages/moments/tweet/repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../component/async_loader/data_controller.dart';
import '../../../network/moments/model/tweet.dart';

class TweetController extends DataController<List<Tweet>> {
  final TweetRepository _repository;

  TweetController({TweetRepository? repository})
      : _repository = repository ?? TweetRepository() {
    data = Rx<List<Tweet>>([]);
  }

  @override
  Future<List<Tweet>> fetch() {
    const startIndex = 0;
    const count = 20;
    return _repository.getTweets(startIndex, count);
  }
}
