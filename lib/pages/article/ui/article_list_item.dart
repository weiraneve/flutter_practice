import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/article/data/article_formatter_extension.dart';

import '../../../res/theme/dimens.dart';
import '../../../res/theme/shape.dart';
import '../data/article.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CornerRadius.S),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    article.attributes?.name ?? '',
                    style: textTheme.titleMedium,
                  ),
                ),
                if (article.attributes?.cardArtworkUrl != null) ...[
                  const SizedBox(width: Dimens.dp16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(CornerRadius.S),
                    child: CachedNetworkImage(
                      width: Dimens.dp50,
                      height: Dimens.dp50,
                      imageUrl: article.attributes!.cardArtworkUrl!,
                    ),
                  ),
                ],
              ],
            ),
            Text(
              article.subscriptionType,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: Dimens.dp16),
            if (article.attributes?.description != null)
              Text(
                article.attributes!.description!,
                style: textTheme.bodyMedium,
              ),
            buildDates(context, article.formattedReleaseDate,
                article.formattedDurationInMinutes),
          ],
        ),
      ),
    );
  }

  Widget buildDates(
      BuildContext context, String? releaseDate, String? duration) {
    final String text;
    if (releaseDate == null && duration != null) {
      text = duration;
    } else if (releaseDate != null && duration == null) {
      text = releaseDate;
    } else if (releaseDate != null && duration != null) {
      text = '$releaseDate ($duration)';
    } else {
      return Container();
    }

    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: textTheme.bodyMedium,
    );
  }
}
