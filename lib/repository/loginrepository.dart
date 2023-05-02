
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class loginRepo{
  Future<loginModel> loginToaccount(String username, String password);
}
class loginInt extends loginRepo{
  @override
  Future<loginModel> loginToaccount(String username, String password) async{
   loginModel? loginobj;
    var response= await http.get(Uri.parse("https://mocki.io/v1/5dbe07f2-bc08-47ee-b12c-edc8661a8495"));
    if (response.statusCode==200){
      print(response.body);
      var data=jsonDecode(response.body);
      loginobj=loginModel.fromJson(data);
    }else{
      print("Error");
    }
    return loginobj!;
    // TODO: implement functionname
    throw UnimplementedError();
  }
  
}



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
  String? name;
  String? place;
  String? email;
  String? password;
  String? sId;
  List<Nearplaces>? nearplaces;
  List<Tavologs>? tavologs;
  String? createdAt;
  int? iV;

  Data(
      {this.name,
        this.place,
        this.email,
        this.password,
        this.sId,
        this.nearplaces,
        this.tavologs,
        this.createdAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    place = json['place'];
    email = json['email'];
    password = json['password'];
    sId = json['_id'];
    if (json['nearplaces'] != null) {
      nearplaces = <Nearplaces>[];
      json['nearplaces'].forEach((v) {
        nearplaces!.add(new Nearplaces.fromJson(v));
      });
    }
    if (json['tavologs'] != null) {
      tavologs = <Tavologs>[];
      json['tavologs'].forEach((v) {
        tavologs!.add(new Tavologs.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['place'] = this.place;
    data['email'] = this.email;
    data['password'] = this.password;
    data['_id'] = this.sId;
    if (this.nearplaces != null) {
      data['nearplaces'] = this.nearplaces!.map((v) => v.toJson()).toList();
    }
    if (this.tavologs != null) {
      data['tavologs'] = this.tavologs!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Nearplaces {
  int? latitude;
  double? longitude;
  String? placeName;
  String? remark;
  double? rating;
  String? review;

  Nearplaces(
      {this.latitude,
        this.longitude,
        this.placeName,
        this.remark,
        this.rating,
        this.review});

  Nearplaces.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    placeName = json['place_name'];
    remark = json['remark'];
    rating = json['rating'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['place_name'] = this.placeName;
    data['remark'] = this.remark;
    data['rating'] = this.rating;
    data['review'] = this.review;
    return data;
  }
}

class Tavologs {
  int? latitude;
  double? longitude;
  String? heading;
  String? auther;
  double? rating;
  String? content;

  Tavologs(
      {this.latitude,
        this.longitude,
        this.heading,
        this.auther,
        this.rating,
        this.content});

  Tavologs.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    heading = json['heading'];
    auther = json['auther'];
    rating = json['rating'];
    content = json['Content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['heading'] = this.heading;
    data['auther'] = this.auther;
    data['rating'] = this.rating;
    data['Content'] = this.content;
    return data;
  }
}