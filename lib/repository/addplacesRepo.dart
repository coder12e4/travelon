import 'dart:convert';

import '../models/addpalceModel.dart';
import 'package:http/http.dart' as http;

abstract class addplaceRepo {
  Future<addplaceModel> newPlaces(
      String name,
      String place,
      String details,
      String address,
      String country,
      String district,
      String state,
      String lat,
      String long);
}

class getAddPlaces extends addplaceRepo {
  Future<addplaceModel> newPlaces(
      String name,
      String place,
      String details,
      String address,
      String country,
      String district,
      String state,
      String lat,
      String long) async {
    addplaceModel? objaddplace;
    var response = await
        http.post(Uri.parse("https://travelon.cyclic.app/user/addplace"),
            body: json.encode({
              "name": name,
              "place": place,
              "detail": details,
              "address": address,
              "country": country,
              "district": district,
              "state": state,
              "latitude": lat,
              "longitude": long
            }),
            headers: <String, String>{
          "Content-Type": "applications/json",
        });
   if(response.statusCode==200){
     print(response.statusCode);
     print(response.body);
     var data=jsonDecode(response.body);
     objaddplace=addplaceModel.fromJson(data);
   }else{
     print("error");
   }
   return objaddplace!;
  }
}
