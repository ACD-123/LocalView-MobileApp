import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';

class UpdateBrandingMedia extends StatelessWidget {
  const UpdateBrandingMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Branding & Media',
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Business Logo",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 100.h,
                width: 150.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/buslogo.png",
                      height: 60.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Add Other Photos and Videos ",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey)),
                    height: 110.h,
                    width: 150.w,
                    child: Image.asset(
                      "assets/videobusiness.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.grey)),
                    height: 110.h,
                    width: 150.w,
                    child: Image.asset(
                      "assets/photo2.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Upto 5 Images",
                    style: TextStyle(
                        fontFamily: AppColors.helvetica,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ],
              ),
              Text(
                "Cover Photo",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                height: 120.h,
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Ensures image respects border radius
                  child: Image.asset(
                    "assets/coverimg.png",
                    fit: BoxFit
                        .fill, // Ensures the image fully covers the container
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ElevetedButton(
                gradientColors: [
                  AppColors.lineargradient1,
                  AppColors.lineargradient2
                ],
                textColor: Colors.white,
                ontap: () {
                  Get.back();
                },
                buttonName: 'Upload More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
