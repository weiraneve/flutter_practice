import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../data/article.dart';
import '../data/article_client.dart';
import 'bloc.dart';

class ArticleDetailBloc implements Bloc {
  final String id;
  final _refreshController = StreamController<void>();
  final _client = ArticleClient();

  late Stream<Article?> articleStream;

  ArticleDetailBloc({
    required this.id,
  }) {
    articleStream = _refreshController.stream
        .startWith(null)
        .mapTo(id)
        .switchMap(
          (id) => _client.getDetailArticle(id).asStream(),
        )
        .asBroadcastStream();
  }

  Future refresh() {
    final future = articleStream.first;
    _refreshController.sink.add(null);
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
  }
}
