import 'package:travel_app_v1/models/comment.dart';
import 'package:travel_app_v1/models/review.dart';

abstract class ReviewServices {
  Future<List<Comment>> getComments(int tripId);
  Future<bool> addComment(Comment comment);
}
