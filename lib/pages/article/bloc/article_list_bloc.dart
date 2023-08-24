import 'dart:async';

import '../data/article.dart';
import '../data/article_client.dart';
import 'bloc.dart';

class ArticleListBloc implements Bloc {
  final _client = ArticleClient();
  final _searchQueryController = StreamController<String?>();
  final _articlesController = StreamController<List<Article>?>();

  Stream<List<Article>?> get articlesStream => _articlesController.stream;

  Sink<String?> get searchQuery => _searchQueryController.sink;

  ArticleListBloc() {
    _searchQueryController.stream.listen((query) {
      _client.fetchArticles(query).then((articles) {
        _articlesController.add(articles);
      }).catchError((error) {
        _articlesController.addError(error);
      });
    });
    _searchQueryController.add(null);
  }

  @override
  void dispose() {
    _searchQueryController.close();
    _articlesController.close();
  }
}
