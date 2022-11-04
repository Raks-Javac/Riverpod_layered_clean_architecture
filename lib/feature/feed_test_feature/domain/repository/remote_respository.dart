import 'package:bottom_nav_test/feature/feed_test_feature/data/entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedRepositoryProvider = Provider<FeedRepository>((ref) {
  return FakeLiveFeed();
});

//interface for the repository
abstract class FeedRepository {
  Future<List<LivePost>> getUserLiveFeed();
}

//a fake repository
class FakeLiveFeed implements FeedRepository {
  @override
  Future<List<LivePost>> getUserLiveFeed() async {
    await Future.delayed(const Duration(seconds: 5));
    return [
      LivePost(
          imagePath: "", isLiked: true, username: "Samantha", isShared: false),
      LivePost(
          imagePath: "", isLiked: true, username: "David", isShared: false),
      LivePost(imagePath: "", isLiked: true, username: "Lemo", isShared: false),
      LivePost(
          imagePath: "", isLiked: true, username: "george", isShared: false),
      LivePost(
          imagePath: "", isLiked: true, username: "daniel", isShared: false),
    ];
  }
}
