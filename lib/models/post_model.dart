class PostModel {
  final String userId;
  final String thumbnail;
  final int likes;
  final int comments;
  String? text;
  List<String>? images;

  PostModel({
    required this.userId,
    required this.thumbnail,
    required this.likes,
    required this.comments,
  });
}
