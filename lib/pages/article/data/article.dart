import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String id;
  final String? type;
  final Attributes? attributes;
  final Links? links;

  Article({required this.id, this.type, this.attributes, this.links});

  Article.fromJson(dynamic json)
      : id = json['id'],
        type = json['type'],
        attributes = Attributes.fromJson(json['attributes']),
        links = Links.fromJson(json['links']);
}

@JsonSerializable()
class Attributes {
  final String? uri;
  final String? name;
  final String? description;
  @JsonKey(name: 'released_at')
  final String? releasedAt;
  final bool? free;
  final String? difficulty;
  @JsonKey(name: 'content_type')
  final String? contentType;
  final int duration;
  final double? popularity;
  @JsonKey(name: 'technology_triple_string')
  final String? technologyTripleString;
  @JsonKey(name: 'contributor_string')
  final String? contributorString;
  final String? ordinal;
  final bool? professional;
  @JsonKey(name: 'description_plain_text')
  final String? descriptionPlainText;
  @JsonKey(name: 'video_identifier')
  final int? videoIdentifier;
  @JsonKey(name: 'parent_name')
  final int? parentName;
  final bool? accessible;
  @JsonKey(name: 'card_artwork_url')
  final String? cardArtworkUrl;

  Attributes(
      {this.uri,
      this.name,
      this.description,
      this.releasedAt,
      this.free,
      this.difficulty,
      this.contentType,
      required this.duration,
      this.popularity,
      this.technologyTripleString,
      this.contributorString,
      this.ordinal,
      this.professional,
      this.descriptionPlainText,
      this.videoIdentifier,
      this.parentName,
      this.accessible,
      this.cardArtworkUrl});

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@JsonSerializable()
class Links {
  final String? self;

  Links({this.self});

  Links.fromJson(Map json) : self = json['self'];
}
