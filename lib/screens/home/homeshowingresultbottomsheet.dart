import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/controller/userbusinesscontroller.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customline.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';
import 'package:url_launcher/url_launcher.dart';

Widget homeshowingresultbottomsheet(
    {required ScrollController scrollController}) {
  final componentcontroller = Get.put(ComponentController());
  final userbusinesscontroller =
      Get.put(UserBusinessController(userBusinessRepo: Get.find()));
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.sp),
        topLeft: Radius.circular(20.sp),
      ),
      color: AppColors.white,
    ),
    child: SingleChildScrollView(
      controller: scrollController,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: customLine()),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Showing Results",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.maincolor,
                              fontFamily: FontFamily.helvetica,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "(${userbusinesscontroller.getusersearchbusiness.value
                                    ?.data?.businesses?.length
                                    .toString() ??
                                "0"})",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.color9494,
                              fontFamily: FontFamily.helvetica,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              componentcontroller.homeSearchResultIcon.value =
                                  !componentcontroller
                                      .homeSearchResultIcon.value;
                              Get.back();
                            },
                            child: Icon(
                              Icons.cancel,
                              size: 18.sp,
                              color: AppColors.colorA7A3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteConstants.filterscreen);
                              },
                              child: Image.asset(
                                "assets/images/filtericon.png",
                                height: 20.h,
                                width: 20.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            customCatgegorySelectedContainer(
                                ontap: () {
                                  componentcontroller
                                      .showingResulttabSelectd("distance");
                                  componentcontroller.showingresultlist
                                      .shuffle();
                                },
                                title: "Distance",
                                isSelected: componentcontroller
                                        .showingResulttabSelectd.value ==
                                    "distance"),
                            SizedBox(
                              width: 15.w,
                            ),
                            customCatgegorySelectedContainer(
                                ontap: () {
                                  componentcontroller
                                      .showingResulttabSelectd("opennow");
                                  componentcontroller.showingresultlist
                                      .shuffle();
                                },
                                title: "Open Now",
                                isSelected: componentcontroller
                                        .showingResulttabSelectd.value ==
                                    "opennow"),
                            SizedBox(
                              width: 15.w,
                            ),
                            customCatgegorySelectedContainer(
                                ontap: () {
                                  componentcontroller
                                      .showingResulttabSelectd("toprated");
                                  componentcontroller.showingresultlist
                                      .shuffle();
                                },
                                title: "Top Rated",
                                isSelected: componentcontroller
                                        .showingResulttabSelectd.value ==
                                    "toprated"),
                            SizedBox(
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      userbusinesscontroller.getusersearchbusinessloading.value
                          ? Column(
                              children: List.generate(
                                  3,
                                  (index) => Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: customDummyLoader(height: 50.h),
                                      )),
                            )
                          : userbusinesscontroller
                                          .getusersearchbusiness.value ==
                                      null ||
                                  userbusinesscontroller
                                          .getusersearchbusiness.value?.data ==
                                      null ||
                                  userbusinesscontroller.getusersearchbusiness
                                          .value?.data?.businesses ==
                                      null ||
                                  userbusinesscontroller.getusersearchbusiness
                                      .value!.data!.businesses!.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Center(
                                    child: customNotDataText(
                                        text: "Results not available"),
                                  ),
                                )
                              : SizedBox(
                                  height: 500.h,
                                  child: ListView.builder(
                                      controller: userbusinesscontroller
                                          .getUserBusinessScrollController,
                                      shrinkWrap: true,
                                      itemCount: userbusinesscontroller
                                          .getusersearchbusiness
                                          .value
                                          ?.data
                                          ?.businesses
                                          ?.length,
                                      itemBuilder: (context, index) {
                                        final searchbusinessdata =
                                            userbusinesscontroller
                                                .getusersearchbusiness
                                                .value
                                                ?.data
                                                ?.businesses?[index];
                                        return customFavDetailContainer(
                                            image: searchbusinessdata?.photos == null ||
                                                    searchbusinessdata!
                                                        .photos!.isEmpty
                                                ? AppConstants.noimage
                                                : searchbusinessdata.photos?.first
                                                        .toString() ??
                                                    AppConstants.noimage,
                                            title: toCamelCase(
                                                searchbusinessdata?.title
                                                    .toString()),
                                            rating: searchbusinessdata?.rating != null
                                                ? (searchbusinessdata!.rating is int
                                                    ? searchbusinessdata.rating
                                                    : (double.tryParse(searchbusinessdata.rating.toString())
                                                            ?.toInt() ??
                                                        0))
                                                : 0,
                                            ratingcount: searchbusinessdata
                                                    ?.rating
                                                    .toString() ??
                                                "",
                                            category: searchbusinessdata?.category == null
                                                ? ""
                                                : toCamelCase(searchbusinessdata?.category?.name.toString()),
                                            distance: "Distance: ${searchbusinessdata?.distanceKm.toStringAsFixed(1)} km",
                                            type: "distance",
                                            screentype: 'showingresult',
                                            cancelremoveontap: () async{
                                               final url = searchbusinessdata?.website;
                                            if (url != null &&
                                                await canLaunchUrl(
                                                    Uri.parse(url))) {
                                              await launchUrl(Uri.parse(url),
                                                  mode: LaunchMode
                                                      .externalApplication);
                                            } else {
                                              customErrorSnackBar(
                                                  message: "URL is not valid");
                                            }
                                            });
                                      }),
                                ),
                      userbusinesscontroller
                              .getusersearchbusinessReloading.value
                          ? Center(
                              child: customCircularProgress(),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}

/////////////
GestureDetector showingResultContainer(
    {required String title, required VoidCallback ontap, dynamic width}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 25.h,
      width: width ?? 90.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: AppColors.white,
          border: Border.all(color: AppColors.black.withOpacity(0.1))),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.black,
            fontFamily: FontFamily.helvetica,
          ),
        ),
      ),
    ),
  );
}
