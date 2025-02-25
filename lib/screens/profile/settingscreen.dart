import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Setting',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                    hintText: "Language: English",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80.sp),
                        borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.2))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80.sp),
                        borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.2))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(80.sp),
                        borderSide: BorderSide(
                            color: AppColors.black.withOpacity(0.2)))),
                items: componentcontroller.languageslist
                    .map<DropdownMenuItem<String>>((language) {
                  return DropdownMenuItem<String>(
                    value: language['name'],
                    child: Row(
                      children: [
                        Text(
                          "Language: ",
                          style: TextStyle(
                              fontFamily: FontFamily.helvetica,
                              fontSize: 11.sp,
                              color: AppColors.black),
                        ),
                        Text(
                          language['name'],
                          style: TextStyle(
                              fontFamily: FontFamily.helvetica,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                icon: Icon(
                  Icons.arrow_drop_down_sharp,
                  color: AppColors.maincolor,
                  size: 25.sp,
                ),
                onChanged: (String? newValue) {},
              ),
              SizedBox(
                height: 10.h,
              ),
              settingTabContainer(
                  title: "Notifications Setting",
                  ontap: () {
                    Get.toNamed(RouteConstants.notificationsettingscreen);
                  },
                  icon: Icons.notifications),
              settingTabContainer(
                  title: "Location Services",
                  ontap: () {
                    customSnackBar(message: "Coming Soon");
                  },
                  icon: Icons.location_on),
              settingTabContainer(
                  title: "Change Password",
                  ontap: () {
                    Get.toNamed(RouteConstants.inappchangepasswordscreen);
                  },
                  icon: Icons.lock),
              settingTabContainer(
                  title: "Payment Methods",
                  ontap: () {
                    customSnackBar(message: "Coming Soon");
                  },
                  image: "assets/images/paymenticon.png"),
              settingTabContainer(
                  title: "Privacy Setting",
                  ontap: () {
                    customSnackBar(message: "Coming Soon");
                  },
                  icon: Icons.privacy_tip),
            ],
          ),
        ),
      ),
    );
  }
}

/////////setting tabs container
Padding settingTabContainer(
    {required String title,
    String? image,
    IconData? icon,
    required VoidCallback ontap}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(80.sp)),
      child: Center(
          child: GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 8.w),
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
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.fill,
                    ),
              SizedBox(
                width: 11.w,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: FontFamily.helvetica,
                    fontSize: 11.sp,
                    color: AppColors.black),
              )
            ],
          ),
        ),
      )),
    ),
  );
}
