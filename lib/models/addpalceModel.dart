class addplaceModel {
  bool? success;
  String? msg;
  Result? result;

  addplaceModel({this.success, this.msg, this.result});

  addplaceModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? detail;
  String? address;
  String? country;
  String? state;
  String? district;
  List<String>? image;
  Location? location;
  bool? status;
  double? totalRating;
  String? createdBy;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Result(
      {this.name,
        this.detail,
        this.address,
        this.country,
        this.state,
        this.district,
        this.image,
        this.location,
        this.status,
        this.totalRating,
        this.createdBy,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    image = json['image'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    status = json['status'];
    totalRating = json['totalRating'];
    createdBy = json['createdBy'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['district'] = this.district;
    data['image'] = this.image;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['totalRating'] = this.totalRating;
    data['createdBy'] = this.createdBy;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  List<double>? coordinates;
  String? type;

  Location({this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}