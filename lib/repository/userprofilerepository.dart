import 'dart:io';
import 'package:get/get.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/models/getallblogsmodel.dart';
import 'package:localview/models/getalluseraddressesmodel.dart';
import 'package:localview/models/getblogbyidmodel.dart';
import 'package:localview/services/apiservices.dart';

class UserProfileRepository extends GetxService {
  HttpApiClient apiClient;
  UserProfileRepository({required this.apiClient});

///////////get user addresses
  Future<GetAllUserAddressesModel?> getAllUserAddresses({
    required String page,
  }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.getuseraddresses}?page=$page",
      );
      if (res.statusCode == 200) {
        final addresseslist = getUserAddressesListModelFromJson(res.body);
        return addresseslist;
      } else {
        return throw Exception("No data field found in the GetAllUserAdresses");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

//////////get all blogs
  Future<GetAllBlogsModel?> getAllBlogs({
    required String page,
  }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.getallblogs}$page&page_size=7",
      );
      if (res.statusCode == 200) {
        final blogslist = getAllBlogsModelFromJson(res.body);
        return blogslist;
      } else {
        return throw Exception("No data field found in the GetAllBlogsList");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

/////////get blog by id
  Future<GetBlogByIdModel?> getBlogById({
    required String blogguid,
  }) async {
    try {
      final res = await apiClient.getFromServer(
        endPoint: "${AppConstants.getblogbyid}$blogguid",
      );
      if (res.statusCode == 200) {
        final blogsbyid = getBlogByIdModelFromJson(res.body);
        return blogsbyid;
      } else {
        return throw Exception("No data field found in the GetBlogById");
      }
    } on SocketException {
      customErrorSnackBar(message: 'No Internet Connection');
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
