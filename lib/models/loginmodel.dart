class loginModel {
  bool? success;
  Data? data;

  loginModel({this.success, this.data});

  loginModel.fromJson(Map<String, dynamic> json) {
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
  UserProfile? userProfile;
  String? token;
  List<NearPlaces>? nearPlaces;
  List<TravelLogs>? travelLogs;

  Data({this.userProfile, this.token, this.nearPlaces, this.travelLogs});

  Data.fromJson(Map<String, dynamic> json) {
    userProfile = json['userProfile'] != null
        ? new UserProfile.fromJson(json['userProfile'])
        : null;
    token = json['token'];
    if (json['nearPlaces'] != null) {
      nearPlaces = <NearPlaces>[];
      json['nearPlaces'].forEach((v) {
        nearPlaces!.add(new NearPlaces.fromJson(v));
      });
    }
    if (json['travelLogs'] != null) {
      travelLogs = <TravelLogs>[];
      json['travelLogs'].forEach((v) {
        travelLogs!.add(new TravelLogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userProfile != null) {
      data['userProfile'] = this.userProfile!.toJson();
    }
    data['token'] = this.token;
    if (this.nearPlaces != null) {
      data['nearPlaces'] = this.nearPlaces!.map((v) => v.toJson()).toList();
    }
    if (this.travelLogs != null) {
      data['travelLogs'] = this.travelLogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserProfile {
  String? name;
  String? sId;
  String? address;
  int? pin;
  String? dob;
  String? bloodGroup;
  String? email;
  int? mob;

  UserProfile(
      {this.name,
        this.sId,
        this.address,
        this.pin,
        this.dob,
        this.bloodGroup,
        this.email,
        this.mob});

  UserProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
    address = json['address'];
    pin = json['pin'];
    dob = json['dob'];
    bloodGroup = json['bloodGroup'];
    email = json['email'];
    mob = json['mob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['_id'] = this.sId;
    data['address'] = this.address;
    data['pin'] = this.pin;
    data['dob'] = this.dob;
    data['bloodGroup'] = this.bloodGroup;
    data['email'] = this.email;
    data['mob'] = this.mob;
    return data;
  }
}

class NearPlaces {
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

  NearPlaces(
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

  NearPlaces.fromJson(Map<String, dynamic> json) {
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

class TravelLogs {
  String? sId;
  String? heading;
  String? remark;
  String? latitude;
  String? longitude;
  String? content;
  List<String>? images;
  bool? status;
  double? rating;
  String? createdAt;
  int? iV;

  TravelLogs(
      {this.sId,
        this.heading,
        this.remark,
        this.latitude,
        this.longitude,
        this.content,
        this.images,
        this.status,
        this.rating,
        this.createdAt,
        this.iV});

  TravelLogs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    heading = json['heading'];
    remark = json['remark'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    content = json['content'];
    images = json['images'].cast<String>();
    status = json['status'];
    rating = json['Rating'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['heading'] = this.heading;
    data['remark'] = this.remark;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['content'] = this.content;
    data['images'] = this.images;
    data['status'] = this.status;
    data['Rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}