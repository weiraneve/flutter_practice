import 'dart:async';

import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../data/article.dart';
import '../data/article_client.dart';
import 'bloc.dart';

class ArticleListBloc implements Bloc {
  final ArticleClient _client;
  final _searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc({ArticleClient? client})
      : _client = client ?? Get.put(ArticleClient()) {
    articlesStream = _searchQueryController.stream
        .startWith(null)
        .debounceTime(const Duration(milliseconds: _debounceTime))
        .switchMap(
            (query) => _client.fetchArticles(query).asStream().startWith(null))
        .asBroadcastStream();
  }

  Future refresh() {
    final future = articlesStream.first;
    _searchQueryController.sink.add(null);
    return future;
  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}

const int _debounceTime = 100;
