import 'dart:convert';

import '../models/fpswdOTP.dart';
import 'package:http/http.dart' as http;

abstract class otpVerify{
  Future<verifyModel>newOTP(String otp);
}
class getOTP extends otpVerify{
  Future<verifyModel>newOTP(String otp)async{
    verifyModel? objverify;
    var response = await http.post(Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/user/verifyForgotOTP"),
    body: json.encode({
      "otp":otp,
    }),
        headers: <String,String>{
      "Content-Type":"application/json",
        }
    );
    if(response.statusCode==200){
      print(response.statusCode);
      print(response.body);
      var data =jsonDecode(response.body);
      objverify =verifyModel.fromJson(data);
    }else{
      print( "error");
    }
    return objverify!;
  }
}