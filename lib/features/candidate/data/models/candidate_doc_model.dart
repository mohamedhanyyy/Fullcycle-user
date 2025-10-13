class CandidateDocModel {
  Data? data;
  int? status;
  String? message;

  CandidateDocModel({this.data, this.status, this.message});

  CandidateDocModel.fromJson(Map<String, dynamic> json) {
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
  Cv? cv;
  Cv? fesh;
  Cv? delegate;

  Data({this.cv, this.fesh, this.delegate});

  Data.fromJson(Map<String, dynamic> json) {
    cv = json['cv'] != null ? Cv.fromJson(json['cv']) : null;
    fesh = json['fesh'] != null ? Cv.fromJson(json['fesh']) : null;
    delegate =
    json['delegate'] != null ? Cv.fromJson(json['delegate']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cv != null) {
      data['cv'] = cv!.toJson();
    }
    if (fesh != null) {
      data['fesh'] = fesh!.toJson();
    }
    if (delegate != null) {
      data['delegate'] = delegate!.toJson();
    }
    return data;
  }
}

class Cv {
  String? name;
  String? url;

  Cv({this.name, this.url});

  Cv.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
