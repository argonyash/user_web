class UserProfileModelData {
  String? status;
  String? msg;
  UserProfileModel? data;

  UserProfileModelData({this.status, this.msg, this.data});

  UserProfileModelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? new UserProfileModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

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
