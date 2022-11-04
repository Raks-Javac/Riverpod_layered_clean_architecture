import 'package:bottom_nav_test/feature/data/entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// the business logic is handled here, [riverpod]
final feedStateController = StateNotifierProvider((ref) {
  return FeedProvider();
});

class FeedProvider extends StateNotifier<List<LivePost>> {
  FeedProvider() : super([]);
  List<LivePost> get getFeedList => state;

  addToLiveFeedList(List<LivePost> post) {
    state = [...state, ...post];
  }


  
  // getUserFeed() async {
  //   await ref.getUserLiveFeed();
  // }

  void isLiked(int index) {
    state[index].isLiked = !state[index].isLiked;
  }

  void isShared(int index) {
    state[index].isShared = !state[index].isShared;
  }
}
