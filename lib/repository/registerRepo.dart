import 'dart:convert';

import 'package:http/http.dart'as http;

import '../models/registermodel.dart';

abstract class registerRepo{
  Future<registerModel>register(
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
}
class registration extends registerRepo{
  Future<registerModel>register(
      String name,
      String email,
      String address,
      int pin,
      var dob,
      int mob,
      String BG,
      var passWord,
      var Confirmpassword,
      int otp,)async{
    registerModel? objregister;
    var response = await http.post(Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/user/registration"),
        body:json.encode({
        "name" : name,
        "email":email,
        "address": address,
        "pin": pin,
        "mob": mob,
        "dob": dob,
        "bloodGroup":BG,
        "password": passWord,
        "confirmPassword": Confirmpassword,
        "otp":otp
        })
    );
    if (response.statusCode==200){
      print(response.statusCode);
      print(response.body);
      var data= jsonDecode(response.body);
      objregister = registerModel.fromJson(data);

    }else{
      print("error");
    }
    return objregister!;
  }
}