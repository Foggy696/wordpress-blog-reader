class Post {
  final int id;
  final String title;
  final String content;
  final String excerpt;
  final String date;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.date,
  });

  /// Create a Post from WordPress JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title']['rendered'] ?? '',
      content: json['content']['rendered'] ?? '',
      excerpt: json['excerpt']['rendered'] ?? '',
      date: json['date'] ?? '',
    );
  }

  /// Convert Post to Map (for SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'excerpt': excerpt,
      'date': date,
    };
  }

  /// Create Post from SQLite Map
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      excerpt: map['excerpt'],
      date: map['date'],
    );
  }
}
