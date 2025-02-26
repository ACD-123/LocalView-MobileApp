import 'dart:convert';
import 'package:get/get.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:http/http.dart' as http;
import 'package:localview/models/getallblogsmodel.dart';
import 'package:localview/models/getalluseraddressesmodel.dart';
import 'package:localview/models/getblogbyidmodel.dart';
import 'package:localview/repository/userprofilerepository.dart';

class UserProfileController extends GetxController {
  UserProfileRepository userProfileRepo;

  UserProfileController({
    required this.userProfileRepo,
  });

////////get all user addresses
  final Rx<GetAllUserAddressesModel?> getalluseraddresses =
      Rx<GetAllUserAddressesModel?>(null);
  final RxBool getalluseraddressesLoading = false.obs;
  final RxBool getalluseraddressesReloading = false.obs;
  final RxInt getalluseraddressesPage = 1.obs;
  Future<void> getAllUserAddresses() async {
    if (getalluseraddressesReloading.value || getalluseraddressesLoading.value)
      return;
    if (getalluseraddressesPage.value > 1 &&
        getalluseraddressesPage.value >
            (getalluseraddresses.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      getalluseraddressesPage.value > 1
          ? getalluseraddressesReloading.value = true
          : getalluseraddressesLoading.value = true;
      final value = await userProfileRepo.getAllUserAddresses(
          page: getalluseraddressesPage.value.toString());
      if (getalluseraddressesPage.value > 1) {
        getalluseraddresses.value?.data?.userAddress
            ?.addAll(value?.data?.userAddress ?? []);
      } else {
        getalluseraddresses.value = value;
      }
      getalluseraddressesPage.value++;
      getalluseraddressesReloading.value = false;
      getalluseraddressesLoading.value = false;
    } catch (e) {
      getalluseraddressesReloading.value = false;
      getalluseraddressesLoading.value = false;
    }
  }

///////////////get map place id
  Future<String?> getPlaceId(String placeName) async {
    String apiKey = AppConstants.mapapiKey;
    String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$placeName&inputtype=textquery&fields=place_id&key=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey("candidates") && data["candidates"].isNotEmpty) {
          return data["candidates"][0]["place_id"];
        } else {
          print("No candidates found or invalid response: ${data}");
        }
      } else {
        print("Error fetching place ID: ${response.statusCode}");
      }
      return null;
    } catch (e) {
      print("Error fetching place ID: $e");
    }
    return null;
  }

//////////get all blogs
  final Rx<GetAllBlogsModel?> getallblogs = Rx<GetAllBlogsModel?>(null);
  final RxBool getallblogsLoading = false.obs;
  final RxBool getallblogsReloading = false.obs;
  final RxInt getallblogsPage = 1.obs;
  Future<void> getAllBlogs() async {
    if (getallblogsReloading.value || getallblogsLoading.value) return;
    if (getallblogsPage.value > 1 &&
        getallblogsPage.value >
            (getallblogs.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      getallblogsPage.value > 1
          ? getallblogsReloading.value = true
          : getallblogsLoading.value = true;
      final value = await userProfileRepo.getAllBlogs(
          page: getallblogsPage.value.toString());
      if (getallblogsPage.value > 1) {
        getallblogs.value?.data?.blogs?.addAll(value?.data?.blogs ?? []);
      } else {
        getallblogs.value = value;
      }
      getallblogsPage.value++;
      getallblogsReloading.value = false;
      getallblogsLoading.value = false;
    } catch (e) {
      getallblogsReloading.value = false;
      getallblogsLoading.value = false;
    }
  }

////////////get blog by id
  final Rx<GetBlogByIdModel?> getblogbyid = Rx<GetBlogByIdModel?>(null);
  final RxBool getblogbyidloading = false.obs;
  Future<void> getBlogById({
    required String blogGuid,
  }) async {
    try {
      getblogbyidloading.value = true;
      await userProfileRepo.getBlogById(blogguid: blogGuid).then((value) {
        getblogbyid.value = value;
        getblogbyidloading.value = false;
      });
    } catch (e) {
      getblogbyidloading.value = false;
    }
  }
}
