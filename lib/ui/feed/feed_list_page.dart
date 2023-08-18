import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/webview_page.dart';
import 'package:provider/provider.dart';

import 'feed_list_page_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(_feedPageTitle),
      ),
      body: Center(
        child: Consumer<FeedListPageProvider>(
          builder: (context, provider, child) {
            // Checking the loading state
            if (provider.isLoading) {
              return const CircularProgressIndicator();
            }

            // Checking if there's any error message
            if (provider.errorMessage != null) {
              return Text('Error: ${provider.errorMessage}');
            }

            if (provider.feeds.isEmpty) {
              return const Text(_dataEmptyWarn);
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
                              WebViewPage(url: feed.link ?? ''),
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
    );
  }
}

const _feedPageTitle = 'Feed Page';
const _dataEmptyWarn = 'No data available.';
