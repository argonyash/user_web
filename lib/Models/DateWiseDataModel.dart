class AttendanceDetailsModel {
  String? date;
  List<AttendanceDetail>? data;

  AttendanceDetailsModel({this.date, this.data});

  AttendanceDetailsModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['data'] != null) {
      data = <AttendanceDetail>[];
      json['data'].forEach((v) {
        data!.add(new AttendanceDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceDetail {
  String? id;
  String? email;
  String? st;
  String? total;
  String? date;
  String? time;

  AttendanceDetail(
      {this.id, this.email, this.st, this.total, this.date, this.time});

  AttendanceDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    st = json['st'];
    total = json['total'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['st'] = this.st;
    data['total'] = this.total;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
