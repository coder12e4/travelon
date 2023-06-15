import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/loginmodel.dart';

abstract class loginRepo {
  Future<loginModel> login(
      String email, String password, String lat, String long, double km);
}

class LoginNew extends loginRepo {
  Future<loginModel> login(
      String email, String password, String lat, String long, double km) async {
    loginModel? objlogin;
    var response = await http.post(
        Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/user/login"),
        body: json.encode({
          "email": email,
          "password": password,
          "lat": lat,
          "long": long,
          "km": km,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objlogin = loginModel.fromJson(data);
    } else {
      print("error");
    }
    return objlogin!;
  }
}

/*

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

*/
