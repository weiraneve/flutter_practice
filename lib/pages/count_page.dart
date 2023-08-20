import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';
import '../res/string/strings.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CountPageState();
  }
}

class CountPageState extends StatefulWidget {
  const CountPageState({super.key});

  @override
  State<CountPageState> createState() => _CountPageStateState();
}

class _CountPageStateState extends State<CountPageState> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.countPageTitle),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(stringRes(R.pushButtonMessage)),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: stringRes(R.incrementTip),
        child: const Icon(Icons.add),
      ),
    );
  }
}
