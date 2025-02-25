import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/helpers/routeconstants.dart';

class VerifyDocumentsScreen extends StatelessWidget {
  const VerifyDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  'Verification Documents',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: AppColors.joan,
                      color: AppColors.textcolor),
                ),
              ),
              Center(
                child: Text(
                  "Upload Documents like a business license or\n utility bill to verify that you are the legitimate\n                 owner of the business.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greytheme,
                    fontFamily: AppColors.helvetica,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Upload Document",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 170,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/documenticon.png", height: 60),
                    // SizedBox(height: 1.h),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevetedButton(
                gradientColors: [
                  AppColors.lineargradient1,
                  AppColors.lineargradient2
                ],
                textColor: Colors.white,
                ontap: () {
                  // Get.toNamed(RouteConstants.addadresscreen);
                },
                buttonName: 'Upload',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
