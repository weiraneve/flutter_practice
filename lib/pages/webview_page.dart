import 'package:flutter/material.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../component/base_scaffold.dart';
import '../res/theme/gaps.dart';

class WebViewPage extends StatelessWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return WebViewPageState(url: url);
  }
}

class WebViewPageState extends StatefulWidget {
  final String url;

  const WebViewPageState({super.key, required this.url});

  @override
  State<WebViewPageState> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPageState> {
  late final WebViewController _controller;
  int _progressValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (!mounted) {
              return;
            }
            debugPrint('WebView is loading (progress : $progress%)');
            setState(() {
              _progressValue = progress;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool canGoBack = await _controller.canGoBack();
        if (canGoBack) {
          await _controller.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: BaseScaffold(
        title: stringRes(R.webviewPageTitle),
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (_progressValue != 100)
              LinearProgressIndicator(
                value: _progressValue / 100,
                backgroundColor: Colors.transparent,
                minHeight: 2,
              )
            else
              Gaps.empty,
          ],
        ),
      ),
    );
  }
}
