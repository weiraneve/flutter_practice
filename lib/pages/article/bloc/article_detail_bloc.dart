import 'dart:async';

import '../data/article.dart';
import '../data/article_client.dart';
import 'bloc.dart';

class ArticleDetailBloc implements Bloc {
  final String id;
  final _refreshController = StreamController<void>();
  final _client = ArticleClient();
  final _articleController = StreamController<Article?>.broadcast(); // <-- 注意这里

  Stream<Article?> get articleStream => _articleController.stream;

  ArticleDetailBloc({
    required this.id,
  }) {
    _refreshController.stream.listen((_) {
      _client.getDetailArticle(id).then((article) {
        _articleController.add(article);
      }).catchError((error) {
        _articleController.addError(error);
      });
    });

    _refreshController.add(null);
  }

  Future refresh() {
    final future = articleStream.first;
    _refreshController.sink.add(null);
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
    _articleController.close();
  }
}
