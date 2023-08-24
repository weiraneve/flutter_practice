import 'package:flutter/material.dart';
import 'package:flutter_practice/component/base_scaffold.dart';
import 'package:flutter_practice/res/string/strings.dart';

import '../bloc/article_detail_bloc.dart';
import '../bloc/bloc_provider.dart';
import '../data/article.dart';
import 'article_detail.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleDetailBloc>(context);
    return BaseScaffold(
      title: stringRes(R.articleDetailTitle),
      body: RefreshIndicator(
        onRefresh: bloc.refresh,
        child: Container(
          alignment: Alignment.center,
          child: _buildContent(bloc),
        ),
      ),
    );
  }

  Widget _buildContent(ArticleDetailBloc bloc) {
    return StreamBuilder<Article?>(
      stream: bloc.articleStream,
      builder: (context, snapshot) {
        final article = snapshot.data;
        if (article == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ArticleDetail(article);
      },
    );
  }
}
