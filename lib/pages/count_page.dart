import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CountPageState(title: _countPageTitle);
  }
}

class CountPageState extends StatefulWidget {
  const CountPageState({super.key, required this.title});

  final String title;

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
      title: widget.title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              _pushButtonMessage,
            ),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: _incrementTip,
        child: const Icon(Icons.add),
      ),
    );
  }
}

const _countPageTitle = 'Count Page';
const _pushButtonMessage = 'You have pushed the button this many times:';
const _incrementTip = 'Increment';
