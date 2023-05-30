import 'dart:convert';

import 'package:travlon/models/nearplacesModel.dart';
import 'package:http/http.dart'as http;

abstract class nearbyrepo{
 Future<nearbyModel>nearbylist();
}
class homeView extends nearbyrepo{

  Future<nearbyModel>nearbylist()async{
    nearbyModel? objnearby;
    var response=await http.post(Uri.parse("https://muddy-deer-turtleneck-shirt.cyclic.app/"),
        body:{
          "lat":11.232547530793925,
          "long":76.05168568558676,
          "km":30,
        }
    );
    if(response.statusCode==200){
      print(response.body);
      var data =jsonDecode(response.body);
      objnearby = nearbyModel.fromJson(data);
    }else{
      print("error");
    }
    return objnearby!;

  }
}