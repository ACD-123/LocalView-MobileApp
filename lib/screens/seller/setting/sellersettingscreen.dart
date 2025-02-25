import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/settingscreen.dart';

class SellerSettingScreen extends StatefulWidget {
  const SellerSettingScreen({super.key});

  @override
  State<SellerSettingScreen> createState() => _SellerSettingScreenState();
}

class _SellerSettingScreenState extends State<SellerSettingScreen> {
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
                    hintStyle: TextStyle(fontSize: 11.sp),
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
                  title: "Notification Preferences",
                  ontap: () {
                    Get.toNamed(RouteConstants.sellernotificationsettingscreen);
                  },
                  icon: Icons.notifications),
              settingTabContainer(
                  title: "Payment Methods",
                  ontap: () {},
                  image: "assets/images/paymenticon.png"),
              settingTabContainer(
                  title: "Security Setting",
                  ontap: () {
                    Get.toNamed(RouteConstants.securityscreen);
                  },
                  icon: Icons.privacy_tip),
            ],
          ),
        ),
      ),
    );
  }
}
