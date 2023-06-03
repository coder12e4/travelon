part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class buttonClicckOneInitial extends HomeState {
  String buttonName="Get Nearest Locations";

}
class buttonClicckOneLoading extends HomeState {
  //Loding progressbar
}
class buttonClicckOneSuccess extends HomeState {

  final bool k;
  final String latitude;
  final String longitude;
  final String address;
  buttonClicckOneSuccess(this.k,this.latitude,this.longitude,this.address);

}
class buttonClicckOneError extends HomeState {

  final bool k;
  buttonClicckOneError(this.k);

}
class buttonClickHomeApiLoading extends HomeState{

}
class buttonClickHomeApiSuccess extends HomeState{
  final nearbyModel obj;
  buttonClickHomeApiSuccess(this.obj);
}
class buttonClickHomeApiFailed extends HomeState{


}