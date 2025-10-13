class UserImageModel {
  Data? data;
  int? status;
  String? message;

  UserImageModel({this.data, this.status, this.message});

  UserImageModel.fromJson(Map<String, dynamic> json) {
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
  String? contentType;
  String? fileName;
  String? extension;
  String? base64Data;

  Data({this.contentType, this.fileName, this.extension, this.base64Data});

  Data.fromJson(Map<String, dynamic> json) {
    contentType = json['contentType'];
    fileName = json['fileName'];
    extension = json['extension'];
    base64Data = json['base64Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contentType'] = contentType;
    data['fileName'] = fileName;
    data['extension'] = extension;
    data['base64Data'] = base64Data;
    return data;
  }
}
