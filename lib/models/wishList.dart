class WishList {
  // Table Schema
  static const tblName = 'wishlist';
  static const colId = 'id';
  static const colCustomerRef = 'customer_ref';
  static const colTripRef = 'trip_ref';

  int? id;
  int? customer_ref;
  int? trip_ref;

  WishList({this.id, this.customer_ref, this.trip_ref});
}
