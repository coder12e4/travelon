class travelogModel {
  bool? success;
  String? msg;
  Result? result;

  travelogModel({this.success, this.msg, this.result});

  travelogModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? heading;
  String? remark;
  String? latitude;
  String? longitude;
  String? content;
  List<String>? images;
  bool? status;
  double? rating;
  String? createdBy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Result(
      {this.heading,
        this.remark,
        this.latitude,
        this.longitude,
        this.content,
        this.images,
        this.status,
        this.rating,
        this.createdBy,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    remark = json['remark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    content = json['content'];
    images = json['images'].cast<String>();
    status = json['status'];
    rating = json['Rating'];
    createdBy = json['createdBy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['remark'] = this.remark;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['content'] = this.content;
    data['images'] = this.images;
    data['status'] = this.status;
    data['Rating'] = this.rating;
    data['createdBy'] = this.createdBy;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}