class Review {
  //Table Schema
  static const tblName = 'reviews';
  static const colId = 'id';
  static const colCusRef = 'cus_ref';
  static const colTripRef = 'trip_ref';
  static const colRate = 'rate';
  static const colReview = 'review';

  int? id;
  int? cusRef;
  int? tripRef;
  int? rate;
  String? review;

  Review({this.id, this.cusRef, this.tripRef, this.rate, this.review});
}
