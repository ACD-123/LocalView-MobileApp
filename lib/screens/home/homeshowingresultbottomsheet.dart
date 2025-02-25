import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customline.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';

Widget homeshowingresultbottomsheet(
    {required ScrollController scrollController}) {
  final componentcontroller = Get.put(ComponentController());
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
        child: Column(
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
                        width: 10.w,
                      ),
                      Text(
                        "(119)",
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
                              !componentcontroller.homeSearchResultIcon.value;
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
                  Obx(
                    () => SingleChildScrollView(
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
                                componentcontroller.showingresultlist.shuffle();
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
                                componentcontroller.showingresultlist.shuffle();
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
                                componentcontroller.showingresultlist.shuffle();
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: componentcontroller.showingresultlist.length,
                      itemBuilder: (context, index) {
                        final favdata =
                            componentcontroller.showingresultlist[index];
                        return customFavDetailContainer(
                            image: favdata['image'],
                            title: favdata['title'],
                            rating: favdata['rating'],
                            ratingcount: favdata['ratingcount'],
                            category: favdata['subtitle'],
                            distance: favdata['distance'],
                            type: favdata['type'],
                            screentype: 'showingresult',
                            cancelremoveontap: () {});
                      }))
                ],
              ),
            ),
          ],
        ),
      ),
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
