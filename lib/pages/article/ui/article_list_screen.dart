import 'package:flutter/material.dart';

import '../../../component/async_loader/error_placeholder.dart';
import '../../../component/base_scaffold.dart';
import '../../../res/string/strings.dart';
import '../../../res/theme/dimens.dart';
import '../bloc/article_detail_bloc.dart';
import '../bloc/article_list_bloc.dart';
import '../bloc/bloc_provider.dart';
import '../data/article.dart';
import 'article_detail_screen.dart';
import 'article_list_item.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  static const String _search = 'Search ...';
  static const String _loading = 'Loading ...';
  static const String _empty = 'No Results';

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleListBloc>(context);
    return BaseScaffold(
        title: stringRes(R.articlePageTitle), body: _buildResults(bloc));
  }

  Widget _buildResults(ArticleListBloc bloc) {
    return StreamBuilder<List<Article>?>(
        stream: bloc.articlesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorPlaceholder(
                errorType: snapshot.error is Exception
                    ? ErrorType.connection
                    : ErrorType.loadingOrParsing,
                onRetry: () {});
          }

          final results = snapshot.data;

          if (results == null) {
            return const Center(child: Text(_loading));
          } else if (results.isEmpty) {
            return const Center(child: Text(_empty));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.dp16),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: _search),
                  onChanged: bloc.searchQuery.add,
                ),
              ),
              Expanded(
                child: _buildSearchResults(results),
              )
            ],
          );
        });
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
            child: ArticleListItem(article: article),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  bloc: ArticleDetailBloc(id: article.id),
                  child: const ArticleDetailScreen(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
