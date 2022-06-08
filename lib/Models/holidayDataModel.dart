class HolidayDataModel {
  String? status;
  String? msg;
  List<HolidayData>? data;

  HolidayDataModel({this.status, this.msg, this.data});

  HolidayDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <HolidayData>[];
      json['data'].forEach((v) {
        data!.add(new HolidayData.fromJson(v));
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

class HolidayData {
  String? id;
  String? des;
  String? date1;
  String? date2;

  HolidayData({this.id, this.des, this.date1, this.date2});

  HolidayData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    des = json['des'];
    date1 = json['date1'];
    date2 = json['date2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['des'] = this.des;
    data['date1'] = this.date1;
    data['date2'] = this.date2;
    return data;
  }
}
