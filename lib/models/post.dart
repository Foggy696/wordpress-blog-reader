class Post {
  final int id;
  final String title;
  final String excerpt;

  Post({
    required this.id,
    required this.title,
    required this.excerpt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title']['rendered'],
      excerpt: json['excerpt']['rendered'],
    );
  }
}
