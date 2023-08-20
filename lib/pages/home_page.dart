import 'package:flutter/material.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:get/get.dart';

import '../component/base_scaffold.dart';
import '../navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                Get.toNamed(Routes.other);
              },
              child: Text(stringRes(R.goOtherButtonText)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.feed);
              },
              child: Text(stringRes(R.goFeedButtonText)),
            ),
          ],
        ),
      ),
    );
  }
}