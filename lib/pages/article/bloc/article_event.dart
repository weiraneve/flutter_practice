sealed class ArticleListEvent {}

class ArticleListFetchEvent extends ArticleListEvent {
  final String query;

  ArticleListFetchEvent(this.query);
}

class ArticleListRefreshEvent extends ArticleListEvent {}
