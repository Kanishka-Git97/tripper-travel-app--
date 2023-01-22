import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/repositories/blog_services.dart';

import '../models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogRepository implements BlogServices {
  @override
  Future<List<Blog>> getBlogs() async {
    List<Blog> data = [];
    var url = Uri.parse('$baseUrl/blog.php');
    var response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result.length > 0) {
        for (var blog in result) {
          data.add(Blog.fromJson(blog));
        }
      }
    }
    return data;
  }
}
