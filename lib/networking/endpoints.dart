enum EndPoints {
  userRegistration,
  login,
  getCountryStateCity,
  sentOtp,
  availability,
  VehicleList,
  VehicleUpdate,
  list_services,
  category_list,
  lists,
  all_services_with_status,
  get_fixa_near,
  nearest_fixa,
  profile_update,
  cancel_service,
  update_price
}

class APIEndPoints {
  static String baseUrl = "https://fix.cloudmlmdemo.com/api/";
  static String urlString(EndPoints endPoint) {
    return baseUrl + endPoint.endPointString;
  }
}

extension EndPointsExtension on EndPoints {
  // ignore: missing_return
  String get endPointString {
    switch (this) {
      case EndPoints.userRegistration:
        return "fixaregister";
      case EndPoints.login:
        return "login";
      case EndPoints.getCountryStateCity:
        return "get_country_state_city";
      case EndPoints.sentOtp:
        return "send_otp";
      case EndPoints.availability:
        return "availability";
      case EndPoints.VehicleList:
        return "vehicle_profile";
      case EndPoints.VehicleUpdate:
        return "vehicleprofile_update";
      case EndPoints.list_services:
        return "service_requests_fixa";

      case EndPoints.category_list:
        return "category_list";
      case EndPoints.lists:
        return "lists";
      case EndPoints.all_services_with_status:
        return "all_services_with_status";
      case EndPoints.get_fixa_near:
        return "get_fixa_near";
      case EndPoints.nearest_fixa:
        return "nearest_fixa";
      case EndPoints.profile_update:
        return "profile_update";
      case EndPoints.cancel_service:
        return "cancel_service";
      case EndPoints.update_price:
        return "update_price";
    }
  }
}
