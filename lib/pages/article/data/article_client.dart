import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../network/client.dart';
import 'article.dart';

class ArticleClient {
  static const String _baseUrl = 'https://api.raywenderlich.com/api';
  static const String _contentTypeKey = 'content-type';
  static const String _contentTypeValue =
      'application/vnd.api+json; charset=utf-8';
  static const String _acceptKey = 'Accept';
  static const String _acceptValue = 'application/json';

  static const String _filterContentTypes = 'filter[content_types][]';
  static const String _filterQuery = 'filter[q]';
  static const String _pageSize = 'page[size]';
  static const String _contentsText = 'contents';
  static const String _dataText = 'data';

  static const String _articleType = 'article';
  static const int _defaultPageSize = 25;

  Map<String, String> get _headers => {
        _contentTypeKey: _contentTypeValue,
        _acceptKey: _acceptValue,
      };

  Future<List<Article>?> fetchArticles(String? query) async {
    Map<String, Object> params = {
      _filterContentTypes: _articleType,
      _pageSize: _defaultPageSize.toString(),
    };

    if (query != null && query.isNotEmpty) {
      params[_filterQuery] = query;
    }

    final results = await request(path: _contentsText, parameters: params);
    return results[_dataText]
        .map<Article>(Article.fromJson)
        .toList(growable: false);
  }

  Future<Article?> getDetailArticle(String id) async {
    final results = await request(path: '$_contentsText/$id', parameters: {});
    final data = results[_dataText];
    return Article.fromJson(data);
  }

  Future<Map> request({
    required String path,
    required Map<String, Object> parameters,
  }) async {
    return (await Get.find<DioClient>().dio.get(
              '$_baseUrl/$path',
              queryParameters: parameters,
              options: Options(headers: _headers),
            ))
        .data;
  }
}
