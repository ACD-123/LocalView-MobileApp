import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/userbusinesscontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  final String? screentype = Get.arguments as String?;
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final userbusinesscontroller =
      Get.put(UserBusinessController(userBusinessRepo: Get.find()));
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userbusinesscontroller.isBusinessSearchMicLoading.value = false;
      userbusinesscontroller.businessSearchController.value.clear();
      userbusinesscontroller.mapplaceCountryregioncontroller.value.clear();
      userbusinesscontroller.mapplacestateprovincecontroller.value.clear();
      userbusinesscontroller.mapplacecitycontroller.value.clear();
      userbusinesscontroller.mapplacezipcodecontroller.value.clear();
      userbusinesscontroller.mapplaceStreetAddres.value = '';
      userbusinesscontroller.mapplaceSelectedLat.value = '';
      userbusinesscontroller.mapplaceSelectedLng.value = '';
      userbusinesscontroller.places.clear();
      userbusinesscontroller.clearfields();

      userbusinesscontroller.businessSearchController.value.addListener(() {
        userbusinesscontroller.fetchPlaces(userbusinesscontroller
            .businessSearchController.value.text
            .toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    userbusinesscontroller.businessSearchController.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: screentype == "searchhistory"
            ? customAppBar(
                title: "Search History",
                ontap: () {
                  Get.back();
                })
            : null,
        bottomNavigationBar: screentype == "searchhistory"
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: customButton(
                    ontap: () {
                      authcontroller.searchistorylist.clear();
                    },
                    text: "Clear History"),
              )
            : const SizedBox(),
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              screentype == "searchhistory"
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              size: 25.sp,
                              color: AppColors.maincolor,
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 300.w,
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 13.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20.sp,
                                    color: AppColors.color2E2E.withOpacity(0.2),
                                  ),
                                  SizedBox(
                                    width: 225.w,
                                    child: TextFormField(
                                      controller: userbusinesscontroller
                                          .businessSearchController.value,
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
                                  GestureDetector(
                                    onTap: () {
                                      userbusinesscontroller
                                          .searchBusinessMicroPhone();
                                    },
                                    child: Icon(
                                        userbusinesscontroller
                                                .isBusinessSearchMicLoading
                                                .value
                                            ? Icons.mic_off_rounded
                                            : Icons.mic_rounded,
                                        size: 20.sp,
                                        color: AppColors.maincolor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              Obx(
                () {
                  if (userbusinesscontroller.places.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: userbusinesscontroller.places.length,
                      itemBuilder: (context, index) {
                        final searchplacedata =
                            userbusinesscontroller.places[index];
                        return ListTile(
                          title: Text(searchplacedata['description']),
                          onTap: () {
                            userbusinesscontroller.mapplaceStreetAddres.value =
                                searchplacedata['description'];
                            userbusinesscontroller.getLatLongFromSearch(
                                searchplacedata['description']);
                            userbusinesscontroller
                                .setSelectedPlace(searchplacedata['place_id']);

                            userbusinesscontroller
                                .businessSearchController.value
                                .clear();
                            userbusinesscontroller.places.clear();
                               
                          },
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              
              userbusinesscontroller.places.isNotEmpty
                  ? SizedBox(
                      height: 10.h,
                    )
                  : const SizedBox(),
            userbusinesscontroller.getusersearchbusinessloading.value ? 
            Image.asset("assets/images/mapsearchgif.gif",height: 200.h,width: 200.w,fit: BoxFit.fill,) :
              SingleChildScrollView(
                  child: Column(
                children: List.generate(authcontroller.searchistorylist.length,
                    (index) {
                  final seachdata = authcontroller.searchistorylist[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 12.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: seachdata['title'] == null ||
                                  seachdata['title'].toString().isEmpty
                              ? CrossAxisAlignment.center
                              : CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.history,
                              color: AppColors.maincolor,
                              size: 25.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  seachdata['title'] == null ||
                                          seachdata['title'].toString().isEmpty
                                      ? const SizedBox()
                                      : Text(
                                          seachdata['title'],
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: FontFamily.helvetica,
                                              color: AppColors.black),
                                        ),
                                  Text(
                                    seachdata['subtitle'],
                                    style: TextStyle(
                                        fontSize: seachdata['title'] == null ||
                                                seachdata['title']
                                                    .toString()
                                                    .isEmpty
                                            ? 12.sp
                                            : 10.sp,
                                        fontFamily: FontFamily.helvetica,
                                        color: AppColors.color8F87),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.black.withOpacity(0.1),
                      )
                    ],
                  );
                }),
              ))
            ],
          ),
        )),
      ),
    );
  }
}
