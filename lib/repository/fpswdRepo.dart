import 'dart:convert';

import '../models/fpswdModel.dart';
import 'package:http/http.dart' as http;

abstract class fpswdRepo{
  Future<fpswdModel>newPswd(String email);


}
class getPswd extends fpswdRepo{
  Future<fpswdModel>newPswd(String email)async{
    fpswdModel? objpswd;
    var response=await http.post(Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/user/otpForgot"),
    body: json.encode({
      "email":email,
    }),
      headers: <String,String>{
      "Content-Type":"application/json",
      });
    if (response.statusCode==200){
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objpswd=fpswdModel.fromJson(data);
    }else{
      print("error");
    }
    return objpswd!;
  }
}
