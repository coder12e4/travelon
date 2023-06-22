import 'dart:convert';

import 'package:travlon/models/travelogModel.dart';
import 'package:http/http.dart' as http;

abstract class travelogRepo {
  Future<travelogModel> newTravelog(
      String heading, String lat, String long, String content, String remark);
}

class addNewTravelog extends travelogRepo {
  Future<travelogModel> newTravelog(String heading, String lat, String long,
      String content, String remark) async {
    travelogModel? objtravlog;
    var response = await http
        .post(Uri.parse("https://travelon.cyclic.app/user/addtravelLog"),
            body: json.encode({
              "heading": heading,
              "latitude": lat,
              "longitude":long,
              "content": content,
              "remark": remark,
            }),
            headers: <String, String>{
          "Content-Type": "applications/json",
        });
    if(response.statusCode==200){
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      objtravlog = travelogModel.fromJson(data);
    }else {
      print("error");
    }
    return objtravlog!;


  }
}
