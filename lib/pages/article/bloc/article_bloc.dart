import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/pages/article/data/article_client.dart';
import 'package:get/get.dart';

import 'article_event.dart';
import 'article_state.dart';

class ArticleListBloc extends Bloc<ArticleListEvent, ArticleListState> {
  final ArticleClient _client = Get.put(ArticleClient());

  ArticleListBloc() : super(ArticleListInitial()) {
    on<ArticleListFetchEvent>(_fetch);
  }

  Future<void> _fetch(
      ArticleListFetchEvent event, Emitter<ArticleListState> emit) async {
    emit(ArticleListInitial());
    await _client.fetchArticles(event.query).then((value) {
      if (value == null) {
        emit(ArticleEmpty());
      } else {
        emit(ArticleListDataLoaded(value));
      }
    }).onError((error, stackTrace) {
      emit(ArticleError(error));
    });
  }
}
