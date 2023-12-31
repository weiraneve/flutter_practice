import 'package:flutter/material.dart';
import 'package:flutter_practice/res/theme/dimens.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap4 = SizedBox(width: Dimens.dp4);
  static const Widget hGap5 = SizedBox(width: Dimens.dp5);
  static const Widget hGap8 = SizedBox(width: Dimens.dp8);
  static const Widget hGap10 = SizedBox(width: Dimens.dp10);
  static const Widget hGap12 = SizedBox(width: Dimens.dp12);
  static const Widget hGap15 = SizedBox(width: Dimens.dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.dp16);
  static const Widget hGap32 = SizedBox(width: Dimens.dp32);

  /// 垂直间隔
  static const Widget vGap4 = SizedBox(height: Dimens.dp4);
  static const Widget vGap5 = SizedBox(height: Dimens.dp5);
  static const Widget vGap8 = SizedBox(height: Dimens.dp8);
  static const Widget vGap10 = SizedBox(height: Dimens.dp10);
  static const Widget vGap12 = SizedBox(height: Dimens.dp12);
  static const Widget vGap15 = SizedBox(height: Dimens.dp15);
  static const Widget vGap16 = SizedBox(height: Dimens.dp16);
  static const Widget vGap24 = SizedBox(height: Dimens.dp24);
  static const Widget vGap32 = SizedBox(height: Dimens.dp32);
  static const Widget vGap50 = SizedBox(height: Dimens.dp50);

  static const Widget line = Divider();

  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  static const Widget empty = SizedBox.shrink();
}
