import 'dart:async';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:travlon/location/locationModel.dart';

class LocationManager {
  static final LocationManager _sharedInsatnce = LocationManager._internal();
  factory LocationManager() {
    return _sharedInsatnce;
  }
  LocationManager._internal();
  static LocationManager get instance => _sharedInsatnce;

  Future<LatLng?> getCurrentLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    _locationData = await location.getLocation();
    return LatLng(_locationData.latitude!, _locationData.longitude!);
  }

  Future<LocationDetails?> getAddressDetails(LatLng latlong) async {
    final coordinates = Coordinates(latlong.latitude, latlong.longitude);
    var results =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    LocationDetails locationDetails = LocationDetails(
        coordinates.latitude,
        coordinates.longitude,
        first.locality,
        first.subAdminArea,
        first.addressLine,
        first.featureName,
        first.postalCode);
    return locationDetails;
    // return null;
  }

  Future<LocationDetails?> getCurrentAddressDetails() async {
    LatLng? latlong = await (getCurrentLocation());
    final coordinates = new Coordinates(latlong!.latitude, latlong.longitude);
    var results =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = results.first;
    LocationDetails locationDetails = LocationDetails(
        coordinates.latitude,
        coordinates.longitude,
        "Kerala",
        first.subAdminArea,
        first.addressLine,
        first.featureName,
        first.postalCode);
    return locationDetails;
    // return null;
  }
}

