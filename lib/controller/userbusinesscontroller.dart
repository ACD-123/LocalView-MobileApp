import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/models/getbusinesscategoriesmodel.dart';
import 'package:localview/models/getbusinessdetailbyplaceidmodel.dart';
import 'package:localview/models/getsearchhistorymodel.dart';
import 'package:localview/models/getusersearchbusinessmodel.dart';
import 'package:localview/repository/userbusinessrepo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

class UserBusinessController extends GetxController {
  UserBusinessRepository userBusinessRepo;

  UserBusinessController({
    required this.userBusinessRepo,
  });

  @override
  void onInit() {
    super.onInit();
    getUserBusinessScrollController
        .addListener(userBusinessPaginationScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    getUserBusinessScrollController.dispose();
  }

/////////////get search places list
  final businessSearchController = TextEditingController().obs;
  final mapplaceCountryregioncontroller = TextEditingController().obs;
  final mapplacestateprovincecontroller = TextEditingController().obs;
  final mapplacecitycontroller = TextEditingController().obs;
  final mapplacezipcodecontroller = TextEditingController().obs;
  final mapplaceStreetAddres = "".obs;
  final RxString mapplaceSelectedLat = "".obs;
  final RxString mapplaceSelectedLng = "".obs;
  final places = List<Map<String, dynamic>>.empty(growable: true).obs;
  final selectedPlace = Map<String, dynamic>().obs;

  void fetchPlaces(String input) async {
    if (input.isEmpty) {
      places.clear();
      return;
    }
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=${AppConstants.mapapiKey}');
    final response = await get(url);
    if (response.statusCode == 200) {
      final predictions =
          json.decode(response.body)['predictions'] as List<dynamic>;
      places.assignAll(predictions.cast<Map<String, dynamic>>());
    }
  }

  void setSelectedPlace(String placeId) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_components&key=${AppConstants.mapapiKey}');
    final response = await get(url);

    if (response.statusCode == 200) {
      final placeDetails =
          json.decode(response.body)['result'] as Map<String, dynamic>;
      selectedPlace.value = placeDetails;

      final addressComponents = placeDetails['address_components'] as List;
      clearfields();

      for (var component in addressComponents) {
        final types = component['types'] as List;
        if (types.contains('country')) {
          mapplaceCountryregioncontroller.value.text = component['long_name'];
        } else if (types.contains('administrative_area_level_1')) {
          mapplacestateprovincecontroller.value.text = component['long_name'];
        } else if (types.contains('locality')) {
          mapplacecitycontroller.value.text = component['long_name'];
        } else if (types.contains('postal_code')) {
          mapplacezipcodecontroller.value.text = component['long_name'];
        }
      }

      if (mapplacezipcodecontroller.value.text.isEmpty) {
        mapplacezipcodecontroller.value.text = 'ZipCode';
      }
      if (mapplaceCountryregioncontroller.value.text.isEmpty) {
        mapplaceCountryregioncontroller.value.text = 'Country';
      }
      if (mapplacecitycontroller.value.text.isEmpty) {
        mapplacecitycontroller.value.text = 'City';
      }
      if (mapplacestateprovincecontroller.value.text.isEmpty) {
        mapplacestateprovincecontroller.value.text = 'State';
      }
    }
  }

  ///get lat long
  Future<void> getLatLongFromSearch(String placeDescription) async {
    try {
      List<Location> locations = await locationFromAddress(placeDescription);
      if (locations.isNotEmpty) {
        mapplaceSelectedLat.value = locations.first.latitude.toString();
        mapplaceSelectedLng.value = locations.first.longitude.toString();
        searchbusinessPage.value = '';
        getUserSearchBusiness();
        searchbusinessCategoryId.value = '';
      } else {
        print("No results found");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  clearfields() {
    mapplacezipcodecontroller.value.clear();
    mapplaceCountryregioncontroller.value.clear();
    mapplacecitycontroller.value.clear();
    mapplacestateprovincecontroller.value.clear();

    getusersearchbusiness.value = null;
    mapplaceStreetAddres.value = '';
  }

//////////user search business
  ScrollController getUserBusinessScrollController = ScrollController();
  void userBusinessPaginationScrolling() {
    if (getUserBusinessScrollController.offset >=
            getUserBusinessScrollController.position.maxScrollExtent &&
        !getUserBusinessScrollController.position.outOfRange) {
      getUserSearchBusiness();
    }
  }

  final RxBool getusersearchbusinessloading = false.obs;
  final RxBool getusersearchbusinessReloading = false.obs;
  final Rx<GetUserSearchBusnissModel?> getusersearchbusiness =
      Rx<GetUserSearchBusnissModel?>(null);
  final RxString searchbusinessCategoryId = "".obs;
  final RxString searchbusinessPage = "".obs;
  final RxDouble searchBusinessMapZoom = 12.0.obs;
  Future<void> getUserSearchBusiness() async {
    try {
      if (getusersearchbusinessloading.value == true ||
          getusersearchbusinessReloading.value == true) return;
      if (mapplaceSelectedLat.isEmpty) return;
      searchbusinessPage.isEmpty
          ? getusersearchbusinessloading.value = true
          : getusersearchbusinessReloading.value = true;
      await userBusinessRepo
          .userSearchBusiness(
              lat: mapplaceSelectedLat.value.toString(),
              long: mapplaceSelectedLng.value.toString(),
              category: searchbusinessCategoryId.value.toString(),
              searchkey: mapplaceStreetAddres.value.toString(),
              pagetoken: getusersearchbusiness
                              .value?.data?.pagination?.nextPageToken ==
                          null ||
                      getusersearchbusiness
                          .value!.data!.pagination!.nextPageToken!.isEmpty
                  ? ""
                  : getusersearchbusiness.value?.data?.pagination?.nextPageToken
                          .toString() ??
                      "")
          .then((value) {
        if (searchbusinessPage.isEmpty) {
          getusersearchbusiness.value = value;
        } else {
          getusersearchbusiness.value?.data?.businesses
              ?.addAll(value?.data?.businesses ?? []);
        }

        searchbusinessPage.value = value?.data?.pagination?.nextPageToken ?? "";
        getusersearchbusinessloading.value = false;
        getusersearchbusinessReloading.value = false;
      });
    } catch (e) {
      getusersearchbusinessloading.value = false;
      getusersearchbusinessReloading.value = false;
    }
  }

/////////get current location
  var currentLocation = const LatLng(40.7127753, -74.0059728).obs;

  Future<void> requestLocationPermission() async {
    while (await Permission.location.isDenied) {
      await Permission.location.request();
    }
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLocation.value = LatLng(position.latitude, position.longitude);
    update();
  }

  Set<Marker> createMarkers() {
    if (getusersearchbusiness.value?.data?.businesses != null &&
        getusersearchbusiness.value!.data!.businesses!.isNotEmpty) {
      return getusersearchbusiness.value!.data!.businesses!
          .where((businessmarker) =>
              businessmarker.latitude != null &&
              businessmarker.longitude != null)
          .map((businessmarker) => Marker(
                markerId: MarkerId(businessmarker.businessGuid == null ||
                        businessmarker.businessGuid!.isEmpty
                    ? businessmarker.placeId ?? ""
                    : businessmarker.businessGuid ?? ""),
                position: LatLng(
                  businessmarker.latitude!,
                  businessmarker.longitude!,
                ),
                 onTap: (){
                  getBusinessDetailByPlaceId(placeId: placeId, categoryid: categoryid)
                },
                infoWindow: InfoWindow(
                  title: businessmarker.title ?? "Unknown",
                  snippet: businessmarker.category?.name ?? "Business Location",
                ),
              ))
          .toSet();
    } else {
      print("Marker is null");
      return {};
    }
  }

/////////////business search mic
  final SpeechToText speech = SpeechToText();
  final RxBool isBusinessSearchMicLoading = false.obs;
  void searchBusinessMicroPhone() async {
    if (await Permission.microphone.request().isDenied) {
      Permission.microphone.request();
      return;
    }
    if (isBusinessSearchMicLoading.value) {
      speech.stop();
    } else if (await speech.initialize()) {
      speech.listen(
          onResult: (res) =>
              businessSearchController.value.text = res.recognizedWords);
    } else {
      customErrorSnackBar(message: "Speech recognition not available.");
    }
    isBusinessSearchMicLoading.toggle();
  }

///////////get business categories
  final Rx<GetBusinessCategoriesModel?> getbusinesscategories =
      Rx<GetBusinessCategoriesModel?>(null);
  final RxBool getbusinesscategoriesLoading = false.obs;
  final RxBool getbusinesscategoriesReloading = false.obs;
  final RxInt getbusinesscategoriesPage = 1.obs;
  Future<void> getBusinessCategories() async {
    if (getbusinesscategoriesReloading.value ||
        getbusinesscategoriesLoading.value) return;
    if (getbusinesscategoriesPage.value > 1 &&
        getbusinesscategoriesPage.value >
            (getbusinesscategories.value?.data?.pagination?.totalPages ?? 0)) {
      return;
    }

    try {
      getbusinesscategoriesPage.value > 1
          ? getbusinesscategoriesReloading.value = true
          : getbusinesscategoriesLoading.value = true;
      final value = await userBusinessRepo.getBusinessCategories(
          page: getbusinesscategoriesPage.value.toString());
      if (getbusinesscategoriesPage.value > 1) {
        getbusinesscategories.value?.data?.categories
            ?.addAll(value?.data?.categories ?? []);
      } else {
        getbusinesscategories.value = value;
      }
      getbusinesscategoriesPage.value++;
      getbusinesscategoriesReloading.value = false;
      getbusinesscategoriesLoading.value = false;
    } catch (e) {
      getbusinesscategoriesReloading.value = false;
      getbusinesscategoriesLoading.value = false;
    }
  }

///////////get search history
  final Rx<GetSearchHistoryModel?> getsearchhistory =
      Rx<GetSearchHistoryModel?>(null);
  final RxBool getsearchhistoryloading = false.obs;
  Future<void> getSearchHistory() async {
    try {
      getsearchhistoryloading.value = true;
      await userBusinessRepo.getSearchHistory().then((value) {
        getsearchhistory.value = value;
        getsearchhistoryloading.value = false;
      });
    } catch (e) {
      getsearchhistoryloading.value = false;
    }
  }

/////////clear search history
  final RxBool clearsearchhistoryloading = false.obs;
  Future<void> clearSearchHistory() async {
    try {
      clearsearchhistoryloading.value = true;
      await userBusinessRepo.clearSearchHistory();

      clearsearchhistoryloading.value = false;
    } catch (e) {
      clearsearchhistoryloading.value = false;
    }
  }

//////////get business details by place id
  final Rx<GetBusinessDetailPlaceIdModel?> getbusinessdetailbyplaceid =
      Rx<GetBusinessDetailPlaceIdModel?>(null);
  final RxBool getbusinessdetailbyplaceidloading = false.obs;
  Future<void> getBusinessDetailByPlaceId({
    required String placeId,
    required String categoryid,
  }) async {
    try {
      getbusinessdetailbyplaceidloading.value = true;
      await userBusinessRepo
          .getBusinessDetailByPlaceId(placeId: placeId, categoryid: categoryid)
          .then((value) {
        getbusinessdetailbyplaceid.value = value;
        getbusinessdetailbyplaceidloading.value = false;
      });
    } catch (e) {
      getbusinessdetailbyplaceidloading.value = false;
    }
  }
}
