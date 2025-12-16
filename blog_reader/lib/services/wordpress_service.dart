import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class WordPressService {
  // Base URL for WordPress REST API
  static const String baseUrl =
      'https://www.englishforyou.cloud/wp-json/wp/v2/posts';

  // Fetch posts from WordPress
  Future<List<Post>> fetchPosts() async {
    final uri = Uri.parse(baseUrl);

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to load posts (status code: ${response.statusCode})',
      );
    }
  }
}
