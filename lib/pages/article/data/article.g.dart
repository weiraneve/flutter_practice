// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
      'links': instance.links,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      uri: json['uri'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      releasedAt: json['released_at'] as String?,
      free: json['free'] as bool?,
      difficulty: json['difficulty'] as String?,
      contentType: json['content_type'] as String?,
      duration: json['duration'] as int,
      popularity: (json['popularity'] as num?)?.toDouble(),
      technologyTripleString: json['technology_triple_string'] as String?,
      contributorString: json['contributor_string'] as String?,
      ordinal: json['ordinal'] as String?,
      professional: json['professional'] as bool?,
      descriptionPlainText: json['description_plain_text'] as String?,
      videoIdentifier: json['video_identifier'] as int?,
      parentName: json['parent_name'] as int?,
      accessible: json['accessible'] as bool?,
      cardArtworkUrl: json['card_artwork_url'] as String?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'name': instance.name,
      'description': instance.description,
      'released_at': instance.releasedAt,
      'free': instance.free,
      'difficulty': instance.difficulty,
      'content_type': instance.contentType,
      'duration': instance.duration,
      'popularity': instance.popularity,
      'technology_triple_string': instance.technologyTripleString,
      'contributor_string': instance.contributorString,
      'ordinal': instance.ordinal,
      'professional': instance.professional,
      'description_plain_text': instance.descriptionPlainText,
      'video_identifier': instance.videoIdentifier,
      'parent_name': instance.parentName,
      'accessible': instance.accessible,
      'card_artwork_url': instance.cardArtworkUrl,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
    };
