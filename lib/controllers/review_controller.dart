import 'package:travel_app_v1/models/comment.dart';
import 'package:travel_app_v1/repositories/review_services.dart';

class ReviewController {
  final ReviewServices services;
  ReviewController(this.services);

  Future<List<Comment>> getComments(int trip) {
    return services.getComments(trip);
  }

  Future<bool> addComment(Comment comment) {
    return services.addComment(comment);
  }
}
