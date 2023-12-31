import 'package:flutter/material.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:get/get.dart';

import '../component/base_scaffold.dart';
import '../navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.homePageTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.count);
              },
              child: Text(stringRes(R.goCountButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.feed);
              },
              child: Text(stringRes(R.goFeedButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.animal);
              },
              child: Text(stringRes(R.goAnimalButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.moments);
              },
              child: Text(stringRes(R.goMomentsButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.article);
              },
              child: Text(stringRes(R.goArticleButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.timer);
              },
              child: Text(stringRes(R.goTimerButtonText)),
            ),
          ],
        ),
      ),
    );
  }
}
