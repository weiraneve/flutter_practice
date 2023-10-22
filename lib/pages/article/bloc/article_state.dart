import '../data/article.dart';

sealed class ArticleListState {}

class ArticleListInitial extends ArticleListState {}

class ArticleListDataLoaded extends ArticleListState {
  late final List<Article> data;

  ArticleListDataLoaded(this.data);
}

class ArticleEmpty extends ArticleListState {}

class ArticleError extends ArticleListState {
  late final dynamic error;

  ArticleError(this.error);
}
