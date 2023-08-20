import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/base_scaffold.dart';
import '../navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: _homePageTitle,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.count);
              },
              child: const Text(_goCountButtonText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.other);
              },
              child: const Text(_goOtherButtonText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.feed);
              },
              child: const Text(_goFeedButtonText),
            ),
          ],
        ),
      ),
    );
  }
}

const _homePageTitle = 'Home Page';
const _goCountButtonText = 'Go to Count Page';
const _goOtherButtonText = 'Go to Other Page';
const _goFeedButtonText = 'Go to Feed Page';
