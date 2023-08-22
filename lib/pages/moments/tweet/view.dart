import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/moments/model/comment.dart';
import '../../../network/moments/model/image.dart' as model;
import '../../../network/moments/model/tweet.dart';
import '../../../res/theme/color.dart';
import '../../../res/theme/dimens.dart';
import '../../../res/theme/shape.dart';
import 'controller.dart';

class TweetView extends StatelessWidget {
  final TweetController _controller;

  const TweetView(TweetController tweetController, {super.key})
      : _controller = tweetController;

  @override
  Widget build(BuildContext context) {
    final tweets = _controller.data.value;

    return ListView.separated(
      itemCount: tweets.length,
      itemBuilder: (_, index) => _tweetItem(tweets[index]),
      separatorBuilder: (_, __) => const Divider(height: BorderWidth.Light),
    );
  }

  Widget _tweetItem(Tweet tweet) => Container(
        margin: const EdgeInsets.symmetric(
            horizontal: EdgeInset.S, vertical: EdgeInset.XS),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            shape: BorderShape.XS,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              imageUrl: tweet.sender?.avatar ?? '',
              width: WidgetSize.L,
              height: WidgetSize.L,
            ),
          ),
          const SizedBox(width: EdgeInset.S),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tweet.sender?.nick ?? tweet.sender?.username ?? '',
                  style: _theme.textTheme.titleLarge?.copyWith(
                      color: momentsUserNameColor,
                      fontWeight: FontWeight.normal),
                ),
                if (tweet.content != null && tweet.content!.isNotEmpty) ...[
                  Text(
                    tweet.content!,
                    style: _theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.normal),
                  )
                ],
                if (tweet.images != null && tweet.images!.isNotEmpty) ...[
                  _imageGrid(tweet.images!)
                ],
                if (tweet.comments != null && tweet.comments!.isNotEmpty) ...[
                  _comments(tweet.comments!)
                ],
              ],
            ),
          ),
        ]),
      );

  Widget _imageGrid(List<model.Image> images) {
    final cnt = images.length;
    final int crossAxisCount;
    if (cnt <= 1) {
      crossAxisCount = 1;
    } else if (cnt <= 3) {
      crossAxisCount = 3;
    } else if (cnt <= 4) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    final double widthFactor;
    if (crossAxisCount == 1 || crossAxisCount == 2) {
      widthFactor = 2 / 3;
    } else {
      widthFactor = 1;
    }

    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: GridView.count(
        padding: const EdgeInsets.symmetric(vertical: EdgeInset.Smallest),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: EdgeInset.Smallest,
        mainAxisSpacing: EdgeInset.Smallest,
        childAspectRatio: 1,
        children: images
            .map((image) => CachedNetworkImage(
                  imageUrl: image.url,
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }

  Widget _comments(List<Comment> comments) => Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: AppColorPalette.neutral.light60,
          shape: BorderShape.XS,
        ),
        margin: const EdgeInsets.only(top: EdgeInset.Smallest),
        padding: const EdgeInsets.symmetric(
            horizontal: EdgeInset.XXS, vertical: EdgeInset.Smallest),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: comments
              .where((it) => it.content.isNotEmpty)
              .map((comment) => _commentItem(comment))
              .toList(),
        ),
      );

  Widget _commentItem(Comment comment) => Text.rich(TextSpan(
        style: _theme.textTheme.titleSmall?.copyWith(height: 1.5),
        children: [
          TextSpan(
            text: comment.sender.nick ?? comment.sender.username ?? '',
            style: const TextStyle(color: momentsUserNameColor),
          ),
          const TextSpan(text: ':'),
          const TextSpan(text: ' '),
          TextSpan(
              text: comment.content,
              style: const TextStyle(fontWeight: FontWeight.normal)),
        ],
      ));

  ThemeData get _theme => Get.theme;
}
