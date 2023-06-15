import 'dart:convert';

import '../models/newPswd.dart';
import 'package:http/http.dart' as http;

abstract class newpswdRepo {
  Future<newPswdModel> newpswd(
      String email, String newPswd, String confirmPswd);
}

class changePswd extends newpswdRepo {
  Future<newPswdModel> newpswd(
      String email, String newPswd, String confirmPswd) async {
    newPswdModel? objnewpswd;
    var response = await http.post(
        Uri.parse(
            "https://muddy-deer-turtleneck-shirt.cyclic.app/user/setNewPassword"),
        body: json.encode(
            {"email": email, "newPswd": newPswd, "confirm": confirmPswd}),
        headers: <String, String>{
          "Content-Type": "application/json",
        });
    if(response.statusCode==200){
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objnewpswd =newPswdModel.fromJson(data);

    }else{
      print("error");
    }
    return objnewpswd!;
  }
}
