import 'package:flutter/material.dart';

import '../bloc/article_list_bloc.dart';
import '../bloc/bloc_provider.dart';
import 'article_list_screen.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: ArticleListBloc(), child: const ArticleListScreen());
  }
}
