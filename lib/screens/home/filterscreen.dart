import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final componentcontroller = Get.put(ComponentController());
  final double startprice = 5;
  final double endprice = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Filter',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customFilterText(text: "Sort By"),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCatgegorySelectedContainer(
                      width: 160.w,
                      ontap: () {
                        componentcontroller
                            .updateFilterScreensortBySelected("relevance");
                      },
                      title: "Relevance",
                      isSelected:
                          componentcontroller.filterscreensortBySelectd.value ==
                              "relevance"),
                  customCatgegorySelectedContainer(
                      width: 160.w,
                      ontap: () {
                        componentcontroller
                            .updateFilterScreensortBySelected("distance");
                      },
                      title: "Distance",
                      isSelected:
                          componentcontroller.filterscreensortBySelectd.value ==
                              "distance"),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            customFilterText(text: "Rating"),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customFilterButton(
                    text: "Any",
                    isSelected:
                        componentcontroller.filterscreenRatingSelected.value ==
                            "any",
                    onPressed: () {
                      componentcontroller
                          .updateFilterScreenRatingSelected("any");
                    },
                  ),
                  customFilterButton(
                      isSelected: componentcontroller
                              .filterscreenRatingSelected.value ==
                          "2",
                      text: "2",
                      onPressed: () {
                        componentcontroller
                            .updateFilterScreenRatingSelected("2");
                      }),
                  customFilterButton(
                      isSelected: componentcontroller
                              .filterscreenRatingSelected.value ==
                          "3",
                      text: "3",
                      onPressed: () {
                        componentcontroller
                            .updateFilterScreenRatingSelected("3");
                      }),
                  customFilterButton(
                      isSelected: componentcontroller
                              .filterscreenRatingSelected.value ==
                          "4",
                      text: "4",
                      onPressed: () {
                        componentcontroller
                            .updateFilterScreenRatingSelected("4");
                      }),
                  customFilterButton(
                      isSelected: componentcontroller
                              .filterscreenRatingSelected.value ==
                          "5",
                      text: "5",
                      onPressed: () {
                        componentcontroller
                            .updateFilterScreenRatingSelected("5");
                      })
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            customFilterText(text: "Price"),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => RangeSlider(
                values: componentcontroller.filtercurrentRangeValues.value,
                min: componentcontroller.filterstartPrice,
                max: componentcontroller.filterendPrice,
                divisions: (componentcontroller.filterendPrice -
                        componentcontroller.filterstartPrice)
                    .toInt(),
                activeColor: AppColors.maincolor,
                inactiveColor: AppColors.colorB7B7,
                labels: RangeLabels(
                  "\$${componentcontroller.filtercurrentRangeValues.value.start.round()}",
                  "\$${componentcontroller.filtercurrentRangeValues.value.end.round()}",
                ),
                onChanged: (values) {
                  componentcontroller.updateFilterRangeValues(values);
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            customFilterText(text: "Hours"),
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCatgegorySelectedContainer(
                      width: 80.w,
                      ontap: () {
                        componentcontroller
                            .updateFilterScreenHoursSelected("any");
                      },
                      title: "Any",
                      isSelected:
                          componentcontroller.filterscreenHoursSelectd.value ==
                              "any"),
                  customCatgegorySelectedContainer(
                      width: 130.w,
                      ontap: () {
                        componentcontroller
                            .updateFilterScreenHoursSelected("opennow");
                      },
                      title: "Open Now",
                      isSelected:
                          componentcontroller.filterscreenHoursSelectd.value ==
                              "opennow"),
                  customCatgegorySelectedContainer(
                      width: 80.w,
                      ontap: () {
                        componentcontroller
                            .updateFilterScreenHoursSelected("custom");
                      },
                      title: "Custom",
                      isSelected:
                          componentcontroller.filterscreenHoursSelectd.value ==
                              "custom"),
                ],
              ),
            ),
            const Spacer(),
            customButton(
                ontap: () {
                  Get.back();
                },
                text: "Apply"),
            SizedBox(
              height: 10.h,
            ),
            // customButton(
            //     ontap: () {},
            //     text: "Cancel",
            //     bordercolor: AppColors.color2E2E.withOpacity(0.2),
            //     textcolor: AppColors.color9494,
            //     buttoncolor: AppColors.white),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}

///////////heading
Text customFilterText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: FontFamily.helvetica,
      color: AppColors.black,
      fontSize: 12.sp,
    ),
  );
}

///////////////
GestureDetector customFilterButton(
    {required String text,
    required VoidCallback onPressed,
    required bool isSelected}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        border: Border.all(
            color: isSelected ? AppColors.maincolor : Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 25.sp,
              color: AppColors.colorFDD8,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: FontFamily.helvetica,
                color: AppColors.black,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
