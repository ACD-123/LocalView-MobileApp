import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class BusinessManagment extends StatefulWidget {
  const BusinessManagment({super.key});

  @override
  State<BusinessManagment> createState() => _BusinessManagmentState();
}

class _BusinessManagmentState extends State<BusinessManagment> {
  // Function to create a reusable container widget
  Widget customContainer(String imagePath, String title) {
    return Container(
      height: 50.h,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 3.w),
            SvgPicture.asset(
              imagePath,
              height: 24.h, // You can adjust the height as per your design
              width: 24.w, // Similarly, adjust the width if needed
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppColors.helvetica,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Business Management',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteConstants.businessiupdatinformation);
                // Get.toNamed(RouteConstants.businessmanagment);
              },
              child: customContainer(
                "assets/bussinesimage.svg",
                "Business Information",
              ),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteConstants.businesscategory);
              },
              child: customContainer(
                  "assets/businesscategoryicon.svg", "Business Category"),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.updatebrandingmedia);
                },
                child: customContainer(
                    "assets/brandmediaicon.svg", "Branding & Media")),
            SizedBox(height: 12.h),
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.bussinesshours);
                },
                child: customContainer(
                    "assets/businesshours.svg", "Business Hours")),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteConstants.socialmediascreen);
              },
              child:
                  customContainer("assets/fb.svg", "Social Media Integration"),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.customersupport);
                },
                child: customContainer(
                    "assets/phoneicon.svg", "Customer Support")),
          ],
        ),
      ),
    );
  }
}
