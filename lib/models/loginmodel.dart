import 'package:travlon/models/nearbyModel.dart';

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
