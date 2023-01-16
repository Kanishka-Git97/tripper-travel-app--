class Customer {
  int? id;
  String? name;
  String? email;
  String? password;
  String? image;

  Customer({this.id, this.name, this.email, this.password, this.image});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['c_name'];
    email = json['c_email'];
    password = json['c_password'];
    image = json['c_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    data['c_name'] = this.name;
    data['c_email'] = this.email;
    data['c_password'] = this.password;
    if (this.image != null) {
      data['c_image'] = this.image;
    } else {
      data['c_image'] = "none";
    }
    return data;
  }
}
