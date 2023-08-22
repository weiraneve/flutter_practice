import 'package:flutter_practice/pages/moments/tweet/controller.dart';
import 'package:flutter_practice/pages/moments/user/controller.dart';
import 'package:get/get.dart';

import '../../component/async_loader/data_controller.dart';

class MomentsController extends DataController<Object> {
  final UserController userController;
  final TweetController tweetController;

  MomentsController({
    UserController? userController,
    TweetController? tweetController,
  })  : userController = userController ?? Get.put(UserController()),
        tweetController = tweetController ?? Get.put(TweetController());

  @override
  Future<Object> fetch() async {
    await Future.wait([
      userController.fetch().then((value) => userController.data.value = value),
      tweetController
          .fetch()
          .then((value) => tweetController.data.value = value),
    ]);
    return Object();
  }
}
