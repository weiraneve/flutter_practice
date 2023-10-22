import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/pages/article/bloc/article_bloc.dart';

import '../../../component/async_loader/error_placeholder.dart';
import '../../../component/base_scaffold.dart';
import '../../../res/string/strings.dart';
import '../../../res/theme/dimens.dart';
import '../bloc/article_event.dart';
import '../bloc/article_state.dart';
import '../data/article.dart';
import 'article_item.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late ArticleListBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _articleBloc = ArticleListBloc();
    _articleBloc.add(ArticleListFetchEvent(''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleListBloc>(
      create: (context) => _articleBloc,
      child: BaseScaffold(
        title: stringRes(R.articlePageTitle),
        body: _buildResults(),
      ),
    );
  }

  Widget _buildResults() {
    const String search = 'Search ...';
    const String loading = 'Loading ...';
    const String empty = 'No Results';

    return BlocConsumer<ArticleListBloc, ArticleListState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ArticleListInitial:
            return const Center(child: Text(loading));
          case ArticleEmpty:
            return const Center(child: Text(empty));
          case ArticleListDataLoaded:
            return _buildSearchResults((state as ArticleListDataLoaded).data);
          case ArticleError:
            return ErrorPlaceholder(
                errorType: (state as ArticleError).error is Exception
                    ? ErrorType.connection
                    : ErrorType.loadingOrParsing,
                onRetry: () => _articleBloc.add(ArticleListFetchEvent('')));
          default:
            return const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Dimens.dp16),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: search),
                  ),
                ),
                // Expanded(
                //   child: _buildSearchResults(bloc.state.data),
                // )
              ],
            );
        }
      },
      listener: (BuildContext context, ArticleListState state) {},
    );
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16),
            child: ArticleItem(article: article),
          ),
          onTap: () {},
        );
      },
    );
  }

  @override
  void dispose() {
    _articleBloc.close();
    super.dispose();
  }
}
