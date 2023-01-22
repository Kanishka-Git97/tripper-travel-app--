class Blog {
  String? id;
  String? title;
  String? description;
  String? city;
  String? country;
  String? image;

  Blog(
      {this.id,
      this.title,
      this.description,
      this.city,
      this.country,
      this.image});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    city = json['city'];
    country = json['country'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['city'] = this.city;
    data['country'] = this.country;
    data['image'] = this.image;
    return data;
  }
}
