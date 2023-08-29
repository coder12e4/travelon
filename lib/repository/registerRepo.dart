import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travlon/models/otpModel.dart';

import '../models/registermodel.dart';

abstract class registerRepo {



  Future<registerModel> register(
    String name,
    String email,
    String address,
    int pin,
    var dob,
    int mob,
    String BG,
    var passWord,
    var Confirmpassword,
    int otp,
  );
  Future<optModel> sentOtp(String email);
}

class registration extends registerRepo {

  Future<registerModel> register(
    String name,
    String email,
    String address,
    int pin,
    var dob,
    int mob,
    String BG,
    var passWord,
    var Confirmpassword,
    int otp,
  ) async {
    registerModel? objregister;

    var response = await http.post(
        Uri.parse(
            "http://ec2-52-63-198-92.ap-southeast-2.compute.amazonaws.com/user/registration"),
        body: json.encode({
          "name": name,
          "email": email,
          "address": address,
          "pin": pin,
          "mob": mob,
          "dob": dob,
          "bloodGroup": BG,
          "password": passWord,
          "confirmPassword": Confirmpassword,
          "otp": otp
        }));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objregister = registerModel.fromJson(data);
    } else {
      print("error");
    }
    return objregister!;
  }

  @override
  Future<optModel> sentOtp(String email) async {
    optModel? objotp;
    var response = await http.post(
        Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/user/otp"),
        body: json.encode({
          "email": email,
        }));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objotp = optModel.fromJson(data);
    } else {
      print("error");
    }
    return objotp!;
  }
}
