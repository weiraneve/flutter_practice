// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_practice/test/pages/article/bloc/article_list_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_practice/pages/article/data/article.dart' as _i4;
import 'package:flutter_practice/pages/article/data/article_client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ArticleClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticleClient extends _i1.Mock implements _i2.ArticleClient {
  @override
  _i3.Future<List<_i4.Article>?> fetchArticles(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchArticles,
          [query],
        ),
        returnValue: _i3.Future<List<_i4.Article>?>.value(),
        returnValueForMissingStub: _i3.Future<List<_i4.Article>?>.value(),
      ) as _i3.Future<List<_i4.Article>?>);
  @override
  _i3.Future<_i4.Article?> getDetailArticle(String? id) => (super.noSuchMethod(
        Invocation.method(
          #getDetailArticle,
          [id],
        ),
        returnValue: _i3.Future<_i4.Article?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.Article?>.value(),
      ) as _i3.Future<_i4.Article?>);
  @override
  _i3.Future<Map<dynamic, dynamic>> request({
    required String? path,
    required Map<String, Object>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [],
          {
            #path: path,
            #parameters: parameters,
          },
        ),
        returnValue:
            _i3.Future<Map<dynamic, dynamic>>.value(<dynamic, dynamic>{}),
        returnValueForMissingStub:
            _i3.Future<Map<dynamic, dynamic>>.value(<dynamic, dynamic>{}),
      ) as _i3.Future<Map<dynamic, dynamic>>);
}