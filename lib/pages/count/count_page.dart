import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/count/count_controller.dart';
import 'package:get/get.dart';

import '../../component/base_scaffold.dart';
import '../../res/string/strings.dart';

class CountPage extends StatelessWidget {
  final CountController _controller;

  CountPage({super.key, CountController? controller})
      : _controller = controller ?? Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.countPageTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(stringRes(R.pushButtonMessage)),
            Obx(
              () => Text(
                '${_controller.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.increment,
        tooltip: stringRes(R.incrementTip),
        child: const Icon(Icons.add),
      ),
    );
  }
}
