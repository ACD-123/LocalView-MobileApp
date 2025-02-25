import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/models/getprofiledatamodel.dart';
import 'package:localview/services/apilogutlis.dart';
import 'package:localview/services/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo extends GetxService {
  HttpApiClient apiClient;
  AuthRepo({required this.apiClient});

/////////////////register
  Future register({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String phonenumber,
  }) async {
    final mapData = {
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "password": password,
      "phone_number": phonenumber,
      "is_user": 1
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.register, data: mapData);
      if (res.statusCode == 200) {
        final message = jsonDecode(res.body)['message'];
        Get.toNamed(RouteConstants.forgotemailverification,
            arguments: {'email': email, 'type': 0});
        customSuccessSnackBar(message: message);
      } else {
        final message = jsonDecode(res.body)['message'];
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred signup. Please try again later.");
      logData(message: e.toString());
    }
  }

////////////login
  Future verifyOTP({
    required String email,
    required String otp,
    required String type,
  }) async {
    final mapData = {
      "email": email,
      "otp": otp,
      "type": type, //0 for email verification 1 for forgot password
      "is_user": 1
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.verifyotp, data: mapData);
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        if (type == '0') {
          Get.offAllNamed(
            RouteConstants.loginscreen,
          );
        } else {
          Get.toNamed(RouteConstants.resetpassword, arguments: email);
        }
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred verify OTP. Please try again later.");
      logData(message: e.toString());
    }
  }

////////////send otp
  Future sendOTP({
    required String email,
    required String type,
    required String navigatetype,
  }) async {
    final mapData = {
      "email": email,
      "type": type, //0 for email verification 1 for forgot password
      "is_user": 1
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.sendotp, data: mapData);
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        navigatetype == "send"
            ? Get.toNamed(RouteConstants.forgotemailverification,
                arguments: {'email': email, 'type': 1})
            : null;
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred Send/Re-Send OTP. Please try again later.");
      logData(message: e.toString());
    }
  }

///////login
  Future login({
    required String email,
    required String password,
  }) async {
    final mapData = {"email": email, "password": password, "is_user": 1};
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.login, data: mapData);
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        final token = jsonDecode(res.body)['data']['token'];
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        Get.offAllNamed(
          RouteConstants.homescreen,
        );
      } else if (res.statusCode == 422) {
        customErrorSnackBar(message: message);
        Get.toNamed(RouteConstants.forgotemailverification,
            arguments: {'email': email, 'type': 0});
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred login. Please try again later.");
      logData(message: e.toString());
    }
  }

///////////reset password
  Future resetPassword({
    required String email,
    required String password,
    required String newpassword,
  }) async {
    final mapData = {
      "email": email,
      "password": password,
      "new_password": newpassword,
      "is_user": 1
    };
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.resetpassword, data: mapData);
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        Get.offAllNamed(
          RouteConstants.loginscreen,
        );
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred reset-password. Please try again later.");
      logData(message: e.toString());
    }
  }

//////////////get profile data
  Future<GetProfileDatModel?> getProfileData() async {
    try {
      final res =
          await apiClient.getFromServer(endPoint: AppConstants.getprofiledata);
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        final profileData =
            getProfileDatModelFromJson(res.body);
        return profileData;
      } else {
        customErrorSnackBar(message: message);
        return null;
      }
    } catch (e) {
      
      customErrorSnackBar(
          message:
              "An unexpected error occurred get-profile-data. Please try again later.");
               return null;
    }
  }


/////////////update profile data
Future updateMyProfileData({
    required String firstname,
    required String lastname,
    required String phonenumber,
    required File? image,
  }) async {
    final mapData = {
      "first_name": firstname,
      "last_name": lastname,
      "phone_number": phonenumber,
    };
    try {
      final res = await apiClient.postImagesToServer(endPoint: AppConstants.updatemyprofiledata, 
      data: mapData, 
      files: {
        'image': image,
      });
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
       Get.back();
       customSuccessSnackBar(message: message);
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred update my profile. Please try again later.");
      logData(message: e.toString());
    }
  }
}
