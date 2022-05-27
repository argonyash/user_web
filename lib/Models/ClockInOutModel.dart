class ClockInOutModel {
  String? status;
  String? msg;
  List<Data>? data;

  ClockInOutModel({this.status, this.msg, this.data});

  ClockInOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? email;
  String? st;
  String? total;
  String? date;
  String? time;

  Data({this.id, this.email, this.st, this.total, this.date, this.time});

  Data.fromJson(Map<String, dynamic> json) {
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
