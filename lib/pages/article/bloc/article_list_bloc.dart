import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../data/article.dart';
import '../data/article_client.dart';
import 'bloc.dart';

class ArticleListBloc implements Bloc {
  final _client = ArticleClient();
  final _searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
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
