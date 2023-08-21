import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/moments/tweet/view.dart';
import 'package:flutter_practice/pages/moments/user/view.dart';
import 'package:get/get.dart';

import '../../component/async_loader/async_load_processor.dart';
import '../../component/async_loader/auto_load_controller.dart';
import '../../component/base_scaffold.dart';
import '../../res/string/strings.dart';
import 'controller.dart';

class MomentsPage extends StatelessWidget {
  final MomentsController _controller;

  MomentsPage({MomentsController? momentsController, Key? key})
      : _controller = momentsController ?? Get.put(MomentsController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.momentsPageTitle),
      body: AsyncLoadProcessor(
        Get.put(AutoLoadController(_controller)),
        content: (data) => NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverToBoxAdapter(
              child: UserView(_controller.userController),
            ),
          ],
          body: TweetView(_controller.tweetController),
        ),
      ),
    );
  }
}
