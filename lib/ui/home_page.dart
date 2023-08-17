import 'package:flutter/material.dart';

import '../navigation/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_homePageTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.count);
              },
              child: const Text(_goCountButtonText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.other);
              },
              child: const Text(_goOtherButtonText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.feed);
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
