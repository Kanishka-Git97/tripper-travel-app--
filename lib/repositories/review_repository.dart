import 'package:travel_app_v1/constant/constant.dart';
import 'package:travel_app_v1/models/customer.dart';
import 'package:travel_app_v1/repositories/review_services.dart';

import '../models/comment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReviewRepository implements ReviewServices {
  @override
  Future<List<Comment>> getComments(int tripId) async {
    List<Comment> comments = [];
    var data = {"trip_id": tripId};
    var url = Uri.parse('$baseUrl/all_reviews.php');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result.length > 0) {
        for (var comment in result) {
          comments.add(new Comment(
              id: int.parse(comment['id']),
              customer: Customer(
                  id: int.parse(comment['cus_id']),
                  name: comment['cus_name'],
                  image: comment['cus_image']),
              rate: int.parse(comment['rate'].toString()),
              comment: comment['comment']));
        }
      }
      return comments;
    } else {
      return comments;
    }
  }

  @override
  Future<bool> addComment(Comment comment) async {
    var url = Uri.parse('$baseUrl/add_comment.php');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(comment.toJson()));
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
