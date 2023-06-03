import 'dart:convert';

import 'package:travlon/models/nearbyModel.dart';
import 'package:http/http.dart'as http;

abstract class nearbyrepo{
 Future<nearbyModel>nearbylist(String lat,String long,String km);
}
class homeView extends nearbyrepo{

  Future<nearbyModel>nearbylist(String lat,String long,String km)async{


    nearbyModel? objnearby;

    var response=await http.post(Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/api/near"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },

        body:json.encode({
          "lat":lat,
          "long":long,
          "km":km,
        })

    );
    if(response.statusCode==200){
     print(response.statusCode);
      print(response.body);
      var data =jsonDecode(response.body);
      objnearby = nearbyModel.fromJson(data);
    }else{
      print("error");
    }
    return objnearby!;

  }
}