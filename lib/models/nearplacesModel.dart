class nearbyModel {
  bool? success;
  Data? data;

  nearbyModel({this.success, this.data});

  nearbyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Result>? result;
  int? count;

  Data({this.result, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Result {
  String? sId;
  String? name;
  String? detail;
  String? address;
  String? country;
  String? state;
  String? district;
  Location? location;
  bool? status;
  String? totalRating;
  int? iV;
  List<String>? image;
  double? distanceInMeters;

  Result(
      {this.sId,
        this.name,
        this.detail,
        this.address,
        this.country,
        this.state,
        this.district,
        this.location,
        this.status,
        this.totalRating,
        this.iV,
        this.image,
        this.distanceInMeters});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    detail = json['detail'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    status = json['status'];
    totalRating = json['totalRating'];
    iV = json['__v'];
    image = json['image'].cast<String>();
    distanceInMeters = json['distance in meters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['district'] = this.district;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['status'] = this.status;
    data['totalRating'] = this.totalRating;
    data['__v'] = this.iV;
    data['image'] = this.image;
    data['distance in meters'] = this.distanceInMeters;
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