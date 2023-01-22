import 'package:travel_app_v1/repositories/blog_services.dart';

import '../models/blog.dart';

class BlogController {
  final BlogServices services;
  BlogController(this.services);

  Future<List<Blog>> getBlogs() async {
    return services.getBlogs();
  }
}
