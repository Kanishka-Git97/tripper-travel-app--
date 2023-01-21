import '../models/blog.dart';

abstract class BlogServices {
  Future<List<Blog>> getBlogs();
}
