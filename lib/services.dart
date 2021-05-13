import 'dart:convert';

import 'package:http/http.dart' as http;
import 'blogModel.dart';

class Services {
  static const String url =
      'https://raw.githubusercontent.com/Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech';

  static Future<Blog> getBlogs() async {
    try {
      final response = await http.get(Uri.https('raw.githubusercontent.com','Muhaiminur/muhaiminur.github.io/master/misfitflutter.tech'));
      if (200 == response.statusCode) {
        return Blog.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }
}
