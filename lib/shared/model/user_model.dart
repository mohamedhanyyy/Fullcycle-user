class UserModel {
  Data? data;
  int? status;
  String? message;

  UserModel({this.data, this.status, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String? refreshTokenId;
  String? authToken;

  Data({this.refreshTokenId, this.authToken});

  Data.fromJson(Map<String, dynamic> json) {
    refreshTokenId = json['refreshTokenId'];
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refreshTokenId'] = refreshTokenId;
    data['authToken'] = authToken;
    return data;
  }
}
