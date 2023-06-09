class registerModel {
  String? msg;
  Data? data;
  String? token;

  registerModel({this.msg, this.data, this.token});

  registerModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? name;
  String? address;
  int? pin;
  int? mob;
  String? dob;
  String? bloodGroup;
  String? email;
  String? password;
  String? sId;
  List<Null>? visitedPlaces;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.name,
      this.address,
      this.pin,
      this.mob,
      this.dob,
      this.bloodGroup,
      this.email,
      this.password,
      this.sId,
      this.visitedPlaces,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    pin = json['pin'];
    mob = json['mob'];
    dob = json['dob'];
    bloodGroup = json['bloodGroup'];
    email = json['email'];
    password = json['password'];
    sId = json['_id'];

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['pin'] = this.pin;
    data['mob'] = this.mob;
    data['dob'] = this.dob;
    data['bloodGroup'] = this.bloodGroup;
    data['email'] = this.email;
    data['password'] = this.password;
    data['_id'] = this.sId;

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
