import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/home/homeprofilebottomsheet.dart';
import 'package:localview/screens/home/homescreenbottomsheet.dart';
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
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(30.34180, -97.75458);

  final Marker _marker = const Marker(
    markerId: MarkerId('unique_marker_id'),
    position: LatLng(30.34180, -97.75458),
    infoWindow: InfoWindow(
      title: 'Apex Creative Designs',
      snippet: 'Austin, TX',
    ),
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    authcontroller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 12.0,
              ),
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              markers: {_marker},
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
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
                                !componentcontroller.homeSearchResultIcon.value;
                            componentcontroller.homeSearchResultIcon.value
                                ? showModalBottomSheet(
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
                                            ScrollController scrollController) {
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
                                componentcontroller.homeSearchResultIcon.value
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.search,
                                size: 20.sp,
                                color: AppColors.color2E2E.withOpacity(0.2),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteConstants.homesearchscreen,
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
                                            fontFamily: FontFamily.helvetica,
                                            color: AppColors.color2E2E
                                                .withOpacity(0.4))),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  customSnackBar(message: "Coming Soon");
                                },
                                child: Icon(Icons.mic_rounded,
                                    size: 20.sp, color: AppColors.maincolor),
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
                                      backgroundImage: NetworkImage(
                                          authcontroller.getprofiledata
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
                  SizedBox(
                    height: 43.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              authcontroller.homecategorieslist.length,
                              (index) {
                        final categoriesdata =
                            authcontroller.homecategorieslist[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: customCatgegoryContainer(
                            ontap: () {
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
                                        ScrollController scrollController) {
                                      return homescreenbottomsheet(
                                          scrollController: scrollController);
                                    },
                                  );
                                },
                              );
                            },
                            title: categoriesdata['name'],
                            image: categoriesdata['image'],
                          ),
                        );
                      })),
                    ),
                  )
                ],
              ),
            ),
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
            Image.asset(
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
