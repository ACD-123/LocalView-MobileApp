import 'dart:io';

import 'package:get/get.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/models/getbusinesscategoriesmodel.dart';
import 'package:localview/models/getusersearchbusinessmodel.dart';
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
}
