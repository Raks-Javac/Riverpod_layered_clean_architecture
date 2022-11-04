import 'package:bottom_nav_test/feature/feed_test_feature/domain/remote_respository.dart';
import 'package:bottom_nav_test/feature/feed_test_feature/presentation/controller/controller.dart';
import 'package:bottom_nav_test/feature/data/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// the main view of the feture would stand here

final getUserFeedProvider = FutureProvider((ref) {
  final feedRepository = ref.watch(feedRepositoryProvider);
  return feedRepository.getUserLiveFeed();
});

class ViewTesting extends ConsumerWidget {
  const ViewTesting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<LivePost>> futureGetFeedProvider =
        ref.watch(getUserFeedProvider);
    ref.watch(feedStateController);
    final feedStateProvider = ref.watch(feedStateController.notifier);
    return futureGetFeedProvider.when(data: (data) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < data.length; i++)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(data[i].username.toString())),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            feedStateProvider.addToLiveFeedList(data);
                            feedStateProvider.isLiked(i);
                          },
                          color: data[i].isLiked ? Colors.blue : Colors.black,
                          icon: const Icon(Icons.save),
                        ),
                        IconButton(
                          onPressed: () {
                            feedStateProvider.addToLiveFeedList(data);
                            feedStateProvider.isShared(i);
                          },
                          color: data[i].isShared ? Colors.blue : Colors.black,
                          icon: const Icon(Icons.share),
                        ),
                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      );
    }, error: (error, _) {
      return Text(error.toString());
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
