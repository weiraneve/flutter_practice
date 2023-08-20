import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../network/feed/model/feed_response.dart';
import '../../repository/feed_repository.dart';

class FeedListPageProvider extends ChangeNotifier {
  final FeedRepository _repository;
  List<FeedModel> _feeds = [];
  bool _isLoading = false;
  String? _errorMessage;

  FeedListPageProvider({FeedRepository? feedRepository})
      : _repository = feedRepository ?? Get.find();

  List<FeedModel> get feeds => _feeds;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future<void> fetchFeeds() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _feeds = await _repository.getFeedModels();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
