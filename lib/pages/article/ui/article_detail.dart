import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/article/data/article_formatter_extension.dart';

import '../../../res/theme/dimens.dart';
import '../data/article.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.dp16, vertical: Dimens.dp32),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.attributes?.cardArtworkUrl != null) ...[
              const SizedBox(width: Dimens.dp16),
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.dp8),
                child: CachedNetworkImage(
                  width: Dimens.dp150,
                  height: Dimens.dp150,
                  imageUrl: article.attributes!.cardArtworkUrl!,
                ),
              ),
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.dp10),
                child: Column(
                  children: [
                    Text(
                      article.attributes?.name ?? '',
                      style: textTheme.titleMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
                      child: Text(
                        article.subscriptionType,
                        style: textTheme.titleSmall,
                      ),
                    ),
                    if (article.formattedReleaseDate != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimens.dp4),
                        child: Text(
                          article.formattedReleaseDate!,
                          style: textTheme.titleSmall,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (article.attributes?.description != null)
          Padding(
            padding: const EdgeInsets.only(left: Dimens.dp16, right: Dimens.dp16, top: Dimens.dp8),
            child: Text(
              article.attributes!.description!,
              style: textTheme.titleMedium,
            ),
          ),
        if (article.attributes?.contributorString != null)
          Padding(
            padding: const EdgeInsets.only(left: Dimens.dp16, right: Dimens.dp16, top: Dimens.dp8),
            child: Text(
              article.attributes!.contributorString!,
              style: textTheme.titleMedium,
            ),
          ),
        if (article.attributes?.technologyTripleString != null)
          Padding(
            padding: const EdgeInsets.only(left: Dimens.dp16, right: Dimens.dp16, top: Dimens.dp32),
            child: Text(
              article.attributes!.technologyTripleString!,
              style: textTheme.titleSmall,
            ),
          )
      ],
    );
  }
}
