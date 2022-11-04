
class LivePost {
  String username;
  bool isLiked;
  bool isShared;
  String imagePath;
  LivePost(
      {required this.imagePath,
      required this.isLiked,
      required this.username,
      required this.isShared});
}
