class CheckInOutModel {
  String? status;
  String? msg;
  Check? data;

  CheckInOutModel({this.status, this.msg, this.data});

  CheckInOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Check.fromJson(json['data']) : null;
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

class Check {
  String? st;
  String? date;
  String? total;
  String? time;

  Check({this.st, this.date, this.total, this.time});

  Check.fromJson(Map<String, dynamic> json) {
    st = json['st'];
    date = json['date'];
    total = json['total'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['st'] = this.st;
    data['date'] = this.date;
    data['total'] = this.total;
    data['time'] = this.time;
    return data;
  }
}
