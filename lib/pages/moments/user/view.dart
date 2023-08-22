import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:get/get.dart';

import '../../../res/theme/dimens.dart';
import '../../../res/theme/shape.dart';
import 'controller.dart';

class UserView extends StatelessWidget {
  final UserController _controller;

  const UserView(UserController userController, {super.key})
      : _controller = userController;

  @override
  Widget build(BuildContext context) {
    final user = _controller.data;
    final theme = Get.theme;

    return ConstraintLayout(children: [
      Container(
        color: theme.colorScheme.secondary,
        child: CachedNetworkImage(
          imageUrl: user.profileImage ?? '',
          fit: BoxFit.cover,
        ),
      ).applyConstraint(
        width: matchParent,
        height: WidgetSize.Giant,
        top: parent.top,
      ),
      Card(
        color: theme.colorScheme.primary,
        shape: BorderShape.S,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: CachedNetworkImage(
          width: WidgetSize.XXL,
          height: WidgetSize.XXL,
          imageUrl: user.avatar ?? '',
          fit: BoxFit.cover,
        ),
      ).applyConstraint(
        id: ConstraintId(_card),
        top: parent.top,
        right: parent.right,
        margin: const EdgeInsets.only(top: 150, right: EdgeInset.S),
      ),
      Text(
        user.nick ?? user.username ?? '',
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.surface,
        ),
      ).applyConstraint(
        right: ConstraintId(_card).left,
        bottom: ConstraintId(_card).bottom,
        margin:
            const EdgeInsets.only(right: EdgeInset.XXS, bottom: EdgeInset.XL),
      ),
    ]);
  }
}

const _card = 'card';
