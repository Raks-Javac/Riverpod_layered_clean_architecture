import 'package:bottom_nav_test/feature/data/entity.dart';

//our local repository if the api call fails and we want to fetch from the store
abstract class LocalRepositoryInterface {
  Future<List<LivePost>> getUserLiveFeed();
}

abstract class LocalRepository implements LocalRepositoryInterface {
  @override
  Future<List<LivePost>> getUserLiveFeed() {
// we can fetch stored feeds here
    throw UnimplementedError();
  }
}
