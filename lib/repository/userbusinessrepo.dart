import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/models/getbusinesscategoriesmodel.dart';
import 'package:localview/models/getbusinessdetailbyplaceidmodel.dart';
import 'package:localview/models/getsearchhistorymodel.dart';
import 'package:localview/models/getusersearchbusinessmodel.dart';
import 'package:localview/services/apilogutlis.dart';
import 'package:localview/services/apiservices.dart';

class UserBusinessRepository extends GetxService {
  HttpApiClient apiClient;
  UserBusinessRepository({required this.apiClient});

//////////////user search business
  Future<GetUserSearchBusnissModel?> userSearchBusiness({
    required String lat,
    required String long,
    required String category,
    required String searchkey,
    required String pagetoken,
  }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint:
            "${AppConstants.usersearchbusiness}latitude=$lat&longitude=$long&category=$category&keyword=$searchkey&pagetoken=$pagetoken",
      );
      if (res.statusCode == 200) {
        pagetoken.isEmpty ? Get.back() : null;
        final businessdata = getUserSearchBusnissModelFromJson(res.body);
        return businessdata;
      } else {
        return throw Exception(
            "No data field found in the GetUserSearchBusiness");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

///////////get business categories
  Future<GetBusinessCategoriesModel?> getBusinessCategories({
    required String page,
  }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.getbusinesscategories}?page=$page",
      );
      if (res.statusCode == 200) {
        final categoriesdata = getCategoriesListModelFromJson(res.body);
        return categoriesdata;
      } else {
        return throw Exception(
            "No data field found in the GetBusinessCategories");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

////////////get search history
  Future<GetSearchHistoryModel?> getSearchHistory() async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: AppConstants.getsearchhistory,
      );
      if (res.statusCode == 200) {
        final searchdata = getSearchHistoryModelFromJson(res.body);
        return searchdata;
      } else {
        return throw Exception("No data field found in the GetSearchHistory");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

/////////////user clear search history
  Future clearSearchHistory() async {
    try {
      final res = await apiClient.postToServer(
          endPoint: AppConstants.clearsearchhistory,
          data: {},
        );
      final message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        customSuccessSnackBar(message: message);
      } else {
        customErrorSnackBar(message: message);
      }
    } on SocketException {
      return customErrorSnackBar(message: 'No Internet Connection');
    } catch (e) {
      customErrorSnackBar(
          message:
              "An unexpected error occurred clear search history. Please try again later.");
      logData(message: e.toString());
    }
  }

////////////get business detail by place id 
 Future<GetBusinessDetailPlaceIdModel?> getBusinessDetailByPlaceId({
  required String placeId,
  required String categoryid,
 }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.getbusinessdetailbyplaceid}$placeId/$categoryid",
      );
      if (res.statusCode == 200) {
        final businessdetaildata = getBusinessDetailPlaceIdModelFromJson(res.body);
        return businessdetaildata;
      } else {
        return throw Exception("No data field found in the GetBusinessDetailByPlaceId");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

}
