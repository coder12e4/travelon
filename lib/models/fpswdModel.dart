class fpswdModel {
  String? status;
  String? message;
  Data? data;

  fpswdModel({this.status, this.message, this.data});

  fpswdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? otp;
  String? createdAt;
  String? expiresAt;
  String? sId;
  int? iV;

  Data(
      {this.email,
        this.otp,
        this.createdAt,
        this.expiresAt,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    otp = json['otp'];
    createdAt = json['createdAt'];
    expiresAt = json['expiresAt'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['createdAt'] = this.createdAt;
    data['expiresAt'] = this.expiresAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}