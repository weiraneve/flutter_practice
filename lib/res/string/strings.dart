import 'dart:io';
import 'dart:ui';

import 'package:flutter_practice/res/string/zh-CN.dart';
import 'package:get/get.dart';

import 'en-US.dart';

class StringResources extends Translations {
  static Locale? get locale {
    final local = Platform.localeName.split('_');
    return Locale.fromSubtags(
        languageCode: local[0],
        countryCode: local.length > 1 ? local[1] : null);
  }

  static const fallbackLocale = Locale('en', 'US');

  static final Map<String, String> _enUS =
  enUS.map((key, value) => MapEntry(key.name, value));
  static final Map<String, String> _zhCN =
  zhCN.map((key, value) => MapEntry(key.name, value));

  @override
  Map<String, Map<String, String>> get keys =>
      {
        'en_US': _enUS,
        'zh_CN': _zhCN,
      };
}

stringRes(R key) => key.name.tr;

enum R {
  appName,
  countPageTitle,
  homePageTitle,
  otherPageTitle,
  webviewPageTitle,
  feedListPageTitle,
  momentsPageTitle,
  pushButtonMessage,
  incrementTip,
  goCountButtonText,
  goOtherButtonText,
  goFeedButtonText,
  goAnimalButtonText,
  goMomentsButtonText,
  goArticleButtonText,
  backHomeButtonText,
  dataEmptyWarn,
  serverErrorMessage,
  animalImagePageTitle,
  retry,
  loading,
  connectionErrorTitle,
  connectionErrorSubtitle,
  loadingOrParsingErrorTitle,
  loadingOrParsingErrorSubtitle,
  articlePageTitle,
  articleDetailTitle,
}
