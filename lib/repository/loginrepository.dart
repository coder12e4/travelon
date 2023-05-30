
import 'dart:convert';
import 'package:http/http.dart' as http;
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

