import 'package:travel_app_v1/models/customer.dart';

class Comment {
  int? id;
  Customer? customer;
  int? trip;
  int? rate;
  String? comment;

  Comment({this.id, this.customer, this.rate, this.comment, this.trip});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer = json['cus_id'];
    rate = json['rate'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['cus_id'] = this.customer!.id;
    data['rate'] = this.rate;
    data['trip_id'] = this.trip;
    data['comment'] = this.comment;
    return data;
  }
}
