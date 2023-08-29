
import 'dart:convert';
import 'package:travlon/Utils/managers/shared_preference_manager.dart';
import 'package:travlon/models/loginmodel.dart';


class UserManager {
  static final UserManager _sharedInsatnce = UserManager._internal();
  UserProfile currentUserProfile = UserProfile();
  //availability  availabity=availability();
  factory UserManager() {
    return _sharedInsatnce;
  }

  UserManager._internal();
  static UserManager get instance => _sharedInsatnce;

  Future<bool> isUserAlreadyLoggedIn() async {
    bool isUserLoggedIn =
        await SharedPreferenceManager().getBoolValueFor("isUserLoggedIn");
    return isUserLoggedIn;
  }

  void setUserLoggedIn(bool isLoggedIn) async {
    SharedPreferenceManager().setBoolValue("isUserLoggedIn", isLoggedIn);
  }

  void setUserProfile(UserProfile userProfile) async {
    currentUserProfile = userProfile;
    String userProfileString = jsonEncode(userProfile.toJson());
    SharedPreferenceManager.instance.setValue("userProfile", userProfileString);
    setUserLoggedIn(true);
  }

  Future<UserProfile?> getUserProfile() async {
    String userProfileString =
        await SharedPreferenceManager.instance.getValueFor("userProfile");
    try {
      Map json = jsonDecode(userProfileString);
      var userProfile = UserProfile.fromJson(json as Map<String, dynamic>);
      return userProfile;
    } catch (error) {
      return null;
    }
  }

  UserProfile getCurrentUserProfile() {
    return currentUserProfile;
  }

  void setUserSession(UserProfile userSession) async {
    String userSessionString = jsonEncode(userSession.toJson());
    SharedPreferenceManager.instance.setValue("userSession", userSessionString);
    setUserLoggedIn(true);
  }

  Future<UserProfile?> getUserSession() async {
    String userString = await SharedPreferenceManager.instance.getValueFor("userSession");

    try {
      Map json = jsonDecode(userString);
      var user = UserProfile.fromJson(json as Map<String, dynamic>);
      return user;
    } catch (error) {
      return null;
    }
  }

  void setUser(UserProfile user) async {
    String userString = jsonEncode(user.toJson());
    SharedPreferenceManager.instance.setValue("loggedInUser", userString);
  }

  Future<UserProfile?> getUser() async {
    String userString = await SharedPreferenceManager.instance.getValueFor("loggedInUser");

    try {
      Map json = jsonDecode(userString);
      var user = UserProfile.fromJson(json as Map<String, dynamic>);
      return user;
    } catch (error) {
      return null;
    }
  }

  Future<String> getToken() {
    return SharedPreferenceManager.instance.getValueFor("token");
  }

  Future<void> logOutUser() async {
    SharedPreferenceManager.instance.clearDefaults();
  }



  void setAvailability(availability userProfile) async {
    availability availabity = userProfile;
    String userProfileString = jsonEncode(userProfile.toJson());
    SharedPreferenceManager.instance.setValue("availability", userProfileString);
    setUserLoggedIn(true);
  }

  Future<availability?> getAvailability() async {
    String userProfileString =
    await SharedPreferenceManager.instance.getValueFor("availability");
    try {
      Map json = jsonDecode(userProfileString);
      var userProfile = availability.fromJson(json as Map<String, dynamic>);
      return userProfile;
    } catch (error) {
      return null;
    }
  }


  Future<bool> isAvailabilitySet() async {
    bool availability =
    await SharedPreferenceManager().getBoolValueFor("isAvailabilitySet");
    return availability;
  }
  void setAvailabilityb(bool isLoggedIn) async {
    SharedPreferenceManager().setBoolValue("isAvailabilitySet", isLoggedIn);
  }
}

class availability {
  String? fromDay;
  String? startTime;
  String? toDay;
  String? endTime;

  availability({this.fromDay, this.startTime, this.toDay, this.endTime});

  availability.fromJson(Map<String, dynamic> json) {
    fromDay = json['FromDay'];
    startTime = json['StartTime'];
    toDay = json['ToDay'];
    endTime = json['EndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FromDay'] = this.fromDay;
    data['StartTime'] = this.startTime;
    data['ToDay'] = this.toDay;
    data['EndTime'] = this.endTime;
    return data;
  }
}
