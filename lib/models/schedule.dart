class Schedule {
  // Table Schema
  static const tblName = 'schedule';
  static const colId = 'id';
  static const colTrip = 'trip';
  static const colStart = 'start';
  static const colEnd = 'end';

  int? id;
  int? trip;
  String? start;
  String? end;

  Schedule({this.id, this.trip, this.start, this.end});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trip = json['trip'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip'] = this.trip;
    data['start'] = this.start;
    data['end'] = this.end;
    return data;
  }
}
