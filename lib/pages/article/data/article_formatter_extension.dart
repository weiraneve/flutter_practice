import 'package:flutter_practice/pages/article/data/article.dart';
import 'package:intl/intl.dart';

extension ArticleFormatterExtension on Article {
  static const String _free = 'free';
  static const String _professional = 'professional';
  static const String _beginner = 'beginner';
  static const String _minutesSuffix = 'minutes';
  static const String _dateFormat = 'MMM d yyyy';

  String get subscriptionType {
    if (attributes?.free == true) {
      return _free;
    }
    if (attributes?.professional == true) {
      return _professional;
    }
    return _beginner;
  }

  String? get formattedReleaseDate {
    final releasedAtString = attributes?.releasedAt;
    if (releasedAtString == null) return null;
    final releasedAt = DateTime.tryParse(releasedAtString);
    if (releasedAt == null) return null;
    return DateFormat(_dateFormat).format(releasedAt);
  }

  String? get formattedDurationInMinutes {
    final duration = attributes?.duration;
    if (duration == null) return null;
    final durationInMinutes = duration / 60;
    return '${durationInMinutes.toStringAsFixed(0)} $_minutesSuffix';
  }
}
