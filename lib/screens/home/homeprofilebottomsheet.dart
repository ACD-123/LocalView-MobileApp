import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customline.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/customwidgets/customswitchbutton.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget homescreenprofilebottomsheet(
    {required ScrollController scrollController}) {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
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
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: customLine(width: 35.w)),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.cancel,
                    color: AppColors.colorA7A3,
                    size: 20.sp,
                  )),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Become a seller",
                  style: TextStyle(
                      fontFamily: FontFamily.joan,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: AppColors.maincolor),
                ),
                Transform.scale(
                  scale: 0.7.sp,
                  child: customSwitchButton(
                      value: componentcontroller.becomeasellerswitch,
                      onChanged: (value) async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('becomeaseller', true);
                        componentcontroller.updateBecomeASellerSwitch(value);
                        Get.offAllNamed(
                            RouteConstants.sellercreatebusinesstepper);
                      }),
                ),
              ],
            ),
            customProfileTabs(
                title: "My Profile",
                icon: Icons.person,
                ontap: () {
                  Get.toNamed(RouteConstants.myprofilescreen);
                }),
            customProfileTabs(
                title: "Favorites",
                icon: Icons.favorite,
                ontap: () {
                  Get.toNamed(RouteConstants.favouritesScreen);
                }),
            customProfileTabs(
                title: "Saved Locations",
                icon: Icons.cloud_done,
                ontap: () {
                  Get.toNamed(RouteConstants.savedScreen);
                }),
            customProfileTabs(
                title: "Notifications",
                icon: Icons.notifications,
                ontap: () {
                  Get.toNamed(RouteConstants.notificationscreen);
                }),
            customProfileTabs(
                title: "Messages",
                image: "assets/images/message.png",
                ontap: () {
                  Get.toNamed(RouteConstants.userchatlistscreen);
                }),
            customProfileTabs(
                title: "Booking and Reservations ",
                image: "assets/images/bookingsicon.png",
                ontap: () {
                  Get.toNamed(RouteConstants.bookingreservationscreen);
                }),
            customProfileTabs(
                title: "Addresses",
                icon: Icons.location_on,
                ontap: () {
                  Get.toNamed(RouteConstants.addressesscreen);
                }),
            customProfileTabs(
                title: "Search History",
                icon: Icons.history,
                ontap: () {
                  Get.toNamed(RouteConstants.homesearchscreen,
                      arguments: "searchhistory");
                }),
            customProfileTabs(
                iconsize: 20.0,
                title: "Blogs and News",
                image: "assets/images/blogs.png",
                ontap: () {
                  Get.toNamed(RouteConstants.blogsnewscreen);
                }),
            customProfileTabs(
                title: "Help & Support",
                icon: Icons.help,
                ontap: () {
                  Get.toNamed(RouteConstants.helpsupportscreen);
                }),
            customProfileTabs(
                title: "Setting",
                image: "assets/images/settingicon.png",
                ontap: () {
                  Get.toNamed(RouteConstants.settingscreen);
                }),
            customButton(
                boxshadow: BoxShadow(
                    color: AppColors.black.withOpacity(0.06),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 9)),
                ontap: () {
                  authcontroller.logout();
                },
                text: "Sign Out",
                buttoncolor: AppColors.colorEF2A,
                bordercolor: AppColors.colorEF2A),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    customSnackBar(message: "Coming Soon");
                  },
                  child: Text(
                    "Privacy Policy -",
                    style: TextStyle(
                        fontFamily: FontFamily.helvetica,
                        fontSize: 13.sp,
                        color: AppColors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    customSnackBar(message: "Coming Soon");
                  },
                  child: Text(
                    " Terms of Services",
                    style: TextStyle(
                        fontFamily: FontFamily.helvetica,
                        fontSize: 13.sp,
                        color: AppColors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

////////////
GestureDetector customProfileTabs(
    {required String title,
    String? image,
    dynamic iconsize,
    IconData? icon,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          image == null || image.isEmpty
              ? Icon(
                  icon,
                  size: 25.sp,
                  color: AppColors.maincolor,
                )
              : Image.asset(
                  image,
                  height: iconsize ?? 24.h,
                  width: iconsize ?? 24.w,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            title,
            style: TextStyle(
                fontFamily: FontFamily.helvetica,
                fontSize: 13.sp,
                color: AppColors.black),
          )
        ],
      ),
    ),
  );
}
