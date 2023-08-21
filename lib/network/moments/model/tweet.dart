import 'package:flutter_practice/network/moments/model/comment.dart';
import 'package:flutter_practice/network/moments/model/image.dart';
import 'package:flutter_practice/network/moments/model/sender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  final String? content;
  final List<Image>? images;
  final Sender? sender;
  final List<Comment>? comments;

  const Tweet(this.content, this.images, this.sender, this.comments);

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);
}
