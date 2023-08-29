import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travlon/Utils/managers/locationManager.dart';
import 'package:travlon/location/locationModel.dart';
part 'getcurrent_location_state.dart';

class GetcurrentLocationCubit extends Cubit<GetcurrentLocationState> {
  GetcurrentLocationCubit() : super(GetcurrentLocationInitial());

  void loadlocationsNear(){
    emit(GetcurrentLocationLoading());
   Future.delayed(Duration(seconds: 0),(){
     emit(GetcurrentLocationSuccess());
   });
   }

  var _selectedLocation;
  void getCurrentAddress() async {
    LocationDetails? locationDetails =
    await LocationManager.instance.getCurrentAddressDetails();
      _selectedLocation = locationDetails!.street;
      var longitude = locationDetails.long.toString();
      var latitude = locationDetails.lat.toString();
      print(latitude);
      print(longitude);
  }



}
