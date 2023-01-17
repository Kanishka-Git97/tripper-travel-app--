class Location {
  // Table Schema
  static const tblName = 'location';
  static const colId = 'id';
  static const colImage = 'image';
  static const colTitle = 'title';
  static const colLongitude = 'longitude';
  static const colLatitude = 'latitude';
  static const colTrip = 'trip';

  int? id;
  String? image;
  String? title;
  double? longitude;
  double? latitude;
  int? trip;

  Location(
      {this.id,
      this.image,
      this.title,
      this.longitude,
      this.latitude,
      this.trip});

  Location.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    image = json['image'];
    title = json['title'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    trip = json['trip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['trip'] = this.trip;
    return data;
  }
}
