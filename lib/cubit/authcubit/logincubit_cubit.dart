import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:travlon/repository/loginrepository.dart';

import '../../models/loginmodel.dart';

part 'logincubit_state.dart';

class LogincubitCubit extends Cubit<LogincubitState> {
  final loginRepo objloginrepo;
  LogincubitCubit(LogincubitState state, this.objloginrepo)
      : super(LogincubitInitial());


  String location = 'Location';
  String latitude="";
  String longitude="";

  Future<void> login( String email, String password, double km) async {
    try {
      emit(LogincubitLoading());
      print(latitude+"   "+longitude);
      loginModel objNew = await objloginrepo.login(email, password, latitude, longitude, 20);
      emit(LogincubitSuccess(objNew));
    } catch (e) {
      emit(LogincubitError());
      print(e);
      emit(LogincubitInitial());
    }
  }

  void getLocation(String email, String password, double km) async {
    _determinePosition().then((value) async {
    latitude=value.latitude.toString();
    longitude=value.longitude.toString();

      /*
      List<Placemark> newPlace =
          await placemarkFromCoordinates(value.latitude, value.longitude);
      Placemark placeMark = newPlace[0];
      String name = placeMark.name.toString();
      String subLocality = placeMark.subLocality.toString();
      String locality = placeMark.locality.toString();
      String administrativeArea = placeMark.administrativeArea.toString();
      String postalCode = placeMark.postalCode.toString();
      String country = placeMark.country.toString();
      String address = "$subLocality$locality,$administrativeArea";
*/
      // parser.saveLatLng(value.latitude, value.longitude, address);

    login(email,password,km);
    }).catchError((error) async {
      await Geolocator.openLocationSettings();
    });

    /////// REAL DATA /////
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
