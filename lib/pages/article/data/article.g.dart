// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
