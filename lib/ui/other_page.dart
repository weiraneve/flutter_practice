import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_otherPageTitle),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(_backHomeButtonText),
        ),
      ),
    );
  }
}

const _otherPageTitle = 'Other Page';
const _backHomeButtonText = 'Go Back to Home';
