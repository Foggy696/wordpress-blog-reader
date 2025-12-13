import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class WordPressService {
  // 🔴 CHANGE THIS to your real WordPress site URL
  static const String baseUrl = 'https://englishforyou.cloud/wp-json/wp/v2/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
