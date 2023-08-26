import 'package:flutter_practice/pages/article/bloc/article_list_bloc.dart';
import 'package:flutter_practice/pages/article/data/article.dart';
import 'package:flutter_practice/pages/article/data/article_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'article_list_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ArticleClient>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  late ArticleListBloc bloc;
  final client = MockArticleClient();
  const String query = 'Ai';

  setUp(() {
    bloc = ArticleListBloc(client: client);
  });

  tearDown(() {
    bloc.dispose();
  });

  test('Fetches articles on query change', () async {
    when(client.fetchArticles(query))
        .thenAnswer((_) async => [Article(id: '1')]);

    bloc.searchQuery.add(query);

    await expectLater(
      bloc.articlesStream,
      emitsInOrder([
        isNull,
        emits(predicate((List<Article>? articles) {
          if (articles == null || articles.isEmpty) return false;
          return articles[0].id == '1';
        }))
      ]),
    );
  });

  test('Refresh triggers a new fetch', () async {
    when(client.fetchArticles(null))
        .thenAnswer((_) async => [Article(id: query)]);
    bloc.refresh();

    await expectLater(
      bloc.articlesStream,
      emitsInOrder([
        isNull,
        emits(predicate((List<Article>? articles) {
          return articles != null &&
              articles.isNotEmpty &&
              articles[0].id == query;
        }))
      ]),
    );
  });
}
