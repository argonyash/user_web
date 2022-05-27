class UserProfileModel {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? adr;
  String? gender;
  String? role;
  String? salary;
  String? pass;
  String? img;
  String? date;
  String? joining;

  UserProfileModel(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.adr,
      this.gender,
      this.role,
      this.salary,
      this.pass,
      this.img,
      this.date,
      this.joining});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    adr = json['adr'];
    gender = json['gender'];
    role = json['role'];
    salary = json['salary'];
    pass = json['pass'];
    img = json['img'];
    date = json['date'];
    joining = json['joining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['adr'] = this.adr;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['salary'] = this.salary;
    data['pass'] = this.pass;
    data['img'] = this.img;
    data['date'] = this.date;
    data['joining'] = this.joining;
    return data;
  }
}
