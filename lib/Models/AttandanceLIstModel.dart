class GetAttandanceListModel {
  String? status;
  String? msg;
  List<Attandance>? data;

  GetAttandanceListModel({this.status, this.msg, this.data});

  GetAttandanceListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Attandance>[];
      json['data'].forEach((v) {
        data!.add(new Attandance.fromJson(v));
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

class Attandance {
  String? id;
  String? email;
  String? reason;
  String? status;
  String? dateFrom;
  String? dateTo;

  Attandance(
      {this.id,
      this.email,
      this.reason,
      this.status,
      this.dateFrom,
      this.dateTo});

  Attandance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    reason = json['reason'];
    status = json['status'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    return data;
  }
}
