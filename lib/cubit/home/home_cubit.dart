import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:travlon/models/nearbyModel.dart';

import '../../repository/nearbyrepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final nearbyrepo objnearbyrepo;
  HomeCubit(HomeState state, this.objnearbyrepo) : super(HomeInitial());
  Future<void>nearby()async{
    emit(HomeLoading());
    nearbyModel objnearby = await objnearbyrepo.nearbylist(1,1,1);
    emit(HomeSuccess(objnearby));
  }
  String location = 'Location';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
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
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }



}
