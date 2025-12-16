import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class WordPressService {
  static const String baseUrl =
      'https://www.englishforyou.cloud/wp-json/wp/v2/posts';

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Accept': 'application/json',
        },
      );

      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE BODY (first 500 chars): ${response.body.substring(0, response.body.length > 500 ? 500 : response.body.length)}');

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('FETCH POSTS ERROR: $e');
      rethrow;
    }
  }
}
