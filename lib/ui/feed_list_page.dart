import 'package:flutter/material.dart';

import '../model/feed_list_entity.dart';
import '../network/feed_api.dart';

class FeedListPage extends StatelessWidget {
  const FeedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FeedListPageState();
  }
}

class FeedListPageState extends StatefulWidget {
  const FeedListPageState({super.key});

  @override
  State<FeedListPageState> createState() => _FeedListPageState();
}

class _FeedListPageState extends State<FeedListPageState> {
  late Future<FeedListEntity> feedList;

  @override
  void initState() {
    super.initState();
    feedList = fetchFeedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_feedPageTitle),
      ),
      body: Center(
        child: FutureBuilder<FeedListEntity>(
          future: feedList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.data == null || snapshot.data!.data.isEmpty) {
                return const Text(_dataEmptyWarn);
              }

              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  var feed = snapshot.data!.data[index];
                  return ListTile(
                    title: Text(feed.name ?? ''),
                    subtitle: Text(feed.link ?? ''),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

const _feedPageTitle = 'Feed Page';
const _dataEmptyWarn = 'No data available.';
