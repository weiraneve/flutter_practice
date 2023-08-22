import 'package:flutter/material.dart';
import 'package:flutter_practice/component/webview.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:provider/provider.dart';

import '../../component/base_scaffold.dart';
import 'provider.dart';

class FeedListPage extends StatelessWidget {
  const FeedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FeedListPageProvider(),
      child: const FeedListPageState(),
    );
  }
}

class FeedListPageState extends StatefulWidget {
  const FeedListPageState({super.key});

  @override
  State<FeedListPageState> createState() => _FeedListPageState();
}

class _FeedListPageState extends State<FeedListPageState> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<FeedListPageProvider>(context, listen: false).fetchFeeds();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.feedListPageTitle),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<FeedListPageProvider>(context, listen: false)
                .refreshFeeds();
          },
          child: Consumer<FeedListPageProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return _LoadingSingleChildScrollView();
              }

              if (provider.errorMessage != null) {
                _ErrorSingleChildScrollView(provider.errorMessage!);
              }

              if (provider.feeds.isEmpty) {
                return _EmptyChildScrollView();
              }

              return ListView.builder(
                itemCount: provider.feeds.length,
                itemBuilder: (context, index) {
                  var feed = provider.feeds[index];
                  return ListTile(
                    title: Text(feed.name ?? ''),
                    subtitle: InkWell(
                      child: Text(
                        feed.link ?? '',
                        style: const TextStyle(
                          color: Colors.blue, // make it look like a link
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WebView(url: feed.link ?? ''),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _LoadingSingleChildScrollView() => const SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: CircularProgressIndicator(),
    );

// ignore: non_constant_identifier_names
Widget _ErrorSingleChildScrollView(String errorMessage) =>
    SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Text('Error: $errorMessage'),
    );

// ignore: non_constant_identifier_names
Widget _EmptyChildScrollView() => SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Text(stringRes(R.goFeedButtonText)),
    );
