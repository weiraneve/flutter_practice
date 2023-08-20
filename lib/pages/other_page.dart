import 'package:flutter/material.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:get/get.dart';

import '../component/base_scaffold.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.otherPageTitle),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text(stringRes(R.backHomeButtonText)),
        ),
      ),
    );
  }
}
