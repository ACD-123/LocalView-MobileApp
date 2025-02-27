import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/controller/userbusinesscontroller.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/home/homeprofilebottomsheet.dart';
import 'package:localview/screens/home/homeshowingresultbottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final componentcontroller = Get.put(ComponentController());
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final userbusinesscontroller =
      Get.put(UserBusinessController(userBusinessRepo: Get.find()));
  final ScrollController businesscategoriesScrollController =
      ScrollController();
  late GoogleMapController mapController;

void _onMapCreated(GoogleMapController controller) {
  mapController = controller;

  Future.delayed(Duration(milliseconds: 2), () {
    Set<Marker> markers = userbusinesscontroller.createMarkers();
    print("Marker Delayed:${markers}");
    if (markers.isNotEmpty) {
      LatLng firstMarkerPosition = markers.first.position;
      mapController!.animateCamera(CameraUpdate.newLatLngZoom(firstMarkerPosition, 15.0));
    }
  });
}


  @override
  void initState() {
    super.initState();
    authcontroller.getProfileData();
    userbusinesscontroller.requestLocationPermission();
    userbusinesscontroller.getbusinesscategoriesPage.value = 1;
    userbusinesscontroller.getBusinessCategories();
            userbusinesscontroller.searchbusinessCategoryId.value = '';
    businesscategoriesScrollController.addListener(() {
      if (businesscategoriesScrollController.position.pixels >=
          businesscategoriesScrollController.position.maxScrollExtent) {
        userbusinesscontroller.getBusinessCategories();
      }
    });
  }

@override
  void dispose() {
    super.dispose();
    userbusinesscontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Obx(
              () {
                 Set<Marker> markers = userbusinesscontroller.createMarkers();
                LatLng initialPosition = markers.isNotEmpty
        ? markers.first.position 
        : userbusinesscontroller.currentLocation.value;
                return GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: initialPosition,
                  zoom: 12.0,
                ),
                onMapCreated: _onMapCreated,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
               onCameraMove: (position) {
        if (position.zoom < userbusinesscontroller.searchBusinessMapZoom.value) {
          userbusinesscontroller.getUserSearchBusiness();
        }
        userbusinesscontroller.searchBusinessMapZoom.value = position.zoom;
      },
                myLocationButtonEnabled: false,
                markers: userbusinesscontroller.createMarkers(),
              );
              }
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                componentcontroller.homeSearchResultIcon.value =
                                    !componentcontroller
                                        .homeSearchResultIcon.value;
                                componentcontroller.homeSearchResultIcon.value
                                    ? showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        isDismissible: false,
                                        enableDrag: false,
                                        builder: (BuildContext context) {
                                          return DraggableScrollableSheet(
                                            expand: false,
                                            initialChildSize: 0.5,
                                            minChildSize: 0.3,
                                            maxChildSize: 0.9,
                                            builder: (BuildContext context,
                                                ScrollController
                                                    scrollController) {
                                              return homeshowingresultbottomsheet(
                                                  scrollController:
                                                      scrollController);
                                            },
                                          );
                                        },
                                      )
                                    : null;
                              },
                              child: CircleAvatar(
                                  backgroundColor: AppColors.maincolor,
                                  child: Image.asset(
                                    componentcontroller
                                            .homeSearchResultIcon.value
                                        ? "assets/images/mapicon.png"
                                        : "assets/images/showingresulticon.png",
                                    height: 18.h,
                                    width: 18.w,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 285.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.2),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 6.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20.sp,
                                    color: AppColors.color2E2E.withOpacity(0.2),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RouteConstants.homesearchscreen,
                                          arguments: "homescreen");
                                    },
                                    child: SizedBox(
                                      width: 180.w,
                                      child: TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Search here",
                                            hintStyle: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily:
                                                    FontFamily.helvetica,
                                                color: AppColors.color2E2E
                                                    .withOpacity(0.4))),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          RouteConstants.homesearchscreen,
                                          arguments: "homescreen");
                                    },
                                    child: Icon(Icons.mic_rounded,
                                        size: 20.sp,
                                        color: AppColors.maincolor),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (BuildContext context) {
                                            return DraggableScrollableSheet(
                                              expand: false,
                                              initialChildSize: 0.5,
                                              minChildSize: 0.3,
                                              maxChildSize: 0.9,
                                              builder: (BuildContext context,
                                                  ScrollController
                                                      scrollController) {
                                                return homescreenprofilebottomsheet(
                                                    scrollController:
                                                        scrollController);
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: Obx(
                                        () => CircleAvatar(
                                          backgroundImage: NetworkImage(authcontroller
                                                          .getprofiledata
                                                          .value ==
                                                      null ||
                                                  authcontroller.getprofiledata
                                                          .value?.data ==
                                                      null ||
                                                  authcontroller.getprofiledata
                                                          .value?.data?.media ==
                                                      null ||
                                                  authcontroller
                                                      .getprofiledata
                                                      .value!
                                                      .data!
                                                      .media!
                                                      .isEmpty
                                              ? AppConstants.noprofileimage
                                              : authcontroller
                                                      .getprofiledata
                                                      .value
                                                      ?.data
                                                      ?.media
                                                      ?.first
                                                      .originalUrl
                                                      .toString() ??
                                                  AppConstants.noprofileimage),
                                          radius: 16.sp,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      userbusinesscontroller.getbusinesscategoriesLoading.value
                          ? SizedBox(
                              height: 43.h,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(3, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: customDummyLoader(
                                      width: 100.w,
                                        color: AppColors.black.withOpacity(0.5),
                                        height: 30.h),
                                  );
                                })),
                              ),
                            )
                          : userbusinesscontroller
                                          .getbusinesscategories.value ==
                                      null ||
                                  userbusinesscontroller
                                          .getbusinesscategories.value?.data ==
                                      null ||
                                  userbusinesscontroller.getbusinesscategories
                                          .value?.data?.categories ==
                                      null ||
                                  userbusinesscontroller.getbusinesscategories
                                      .value!.data!.categories!.isEmpty
                              ? const SizedBox()
                              : SizedBox(
                                  height: 43.h,
                                  child: SingleChildScrollView(
                                    controller:
                                        businesscategoriesScrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: [
                                          ...List.generate(
                                            userbusinesscontroller
                                                    .getbusinesscategories
                                                    .value
                                                    ?.data
                                                    ?.categories
                                                    ?.length ??
                                                0, (index) {
                                      final categoriesdata =
                                          userbusinesscontroller
                                              .getbusinesscategories
                                              .value
                                              ?.data
                                              ?.categories?[index];
                                      return Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: customCatgegoryContainer(
                                          ontap: () {
                                            // showModalBottomSheet(
                                            //   context: context,
                                            //   isScrollControlled: true,
                                            //   backgroundColor:
                                            //       Colors.transparent,
                                            //   builder: (BuildContext context) {
                                            //     return DraggableScrollableSheet(
                                            //       expand: false,
                                            //       initialChildSize: 0.5,
                                            //       minChildSize: 0.3,
                                            //       maxChildSize: 0.9,
                                            //       builder: (BuildContext
                                            //               context,
                                            //           ScrollController
                                            //               scrollController) {
                                            //         return homescreenbottomsheet(
                                            //             scrollController:
                                            //                 scrollController);
                                            //       },
                                            //     );
                                            //   },
                                            // );
                                         Get.toNamed(
                                          RouteConstants.homesearchscreen,
                                          arguments: "homescreen");
                                        userbusinesscontroller.searchbusinessCategoryId.value = categoriesdata?.id.toString() ?? "";
                                    
                                          },
                                          title: toCamelCase(
                                              categoriesdata?.name.toString() ??
                                                  ""),
                                          image: categoriesdata?.image ??
                                              AppConstants.noimage,
                                        ),
                                      );
                                    }),

                                    userbusinesscontroller.getbusinesscategoriesReloading.value ? 
                                    SizedBox(height: 20.h,width: 20.w,child: customCircularProgress(),) : const SizedBox()
                                        ]),
                                  ),
                                )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

//////////custom home category container
GestureDetector customCatgegoryContainer(
    {required VoidCallback ontap,
    required String title,
    required String image}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp), color: AppColors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            Image.network(
              image,
              height: 20.h,
              width: 20.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.helvetica,
                  color: AppColors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
