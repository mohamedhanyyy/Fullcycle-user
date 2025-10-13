class QrProfileModel {
  Data? data;
  int? status;
  String? message;

  QrProfileModel({this.data, this.status, this.message});

  QrProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? qr;

  Data({this.id, this.name, this.qr});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['qr'] = qr;
    return data;
  }
}
