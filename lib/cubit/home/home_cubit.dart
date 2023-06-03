import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/nearbyModel.dart';

import '../../repository/nearbyrepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final nearbyrepo objnearbyrepo;
  HomeCubit(HomeState state, this.objnearbyrepo)
      : super(buttonClicckOneInitial());

  String location = 'Location';

  void getLocation() async {
    emit(buttonClicckOneLoading());

    _determinePosition().then((value) async {
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
      emit(buttonClicckOneSuccess(true, value.latitude.toString(),
          value.longitude.toString(), address));
      // parser.saveLatLng(value.latitude, value.longitude, address);
    }).catchError((error) async {
      emit(buttonClicckOneError(false));
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

  Future<void> getGuestHome(String lat, String long, String km) async {

    try{
      emit(buttonClickHomeApiLoading());
      nearbyModel objNearBy = await objnearbyrepo.nearbylist(lat, long, km);
      if (objNearBy.success!) {
        emit(buttonClickHomeApiSuccess(objNearBy));
      }else {
        emit(buttonClickHomeApiFailed());
      }
    }catch(e){
      print(e);
    }

  }
}
