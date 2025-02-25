import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/screens/home/filterscreen.dart';

class SendFeedbackScreen extends StatefulWidget {
  const SendFeedbackScreen({super.key});

  @override
  State<SendFeedbackScreen> createState() => _SendFeedbackScreenState();
}

class _SendFeedbackScreenState extends State<SendFeedbackScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Send Feedback',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customFilterText(text: "Rate Your Experience"),
              SizedBox(
                height: 12.h,
              ),
              RatingBar(
                filledIcon: Icons.star,
                size: 30.sp,
                filledColor: AppColors.colorFDD8,
                emptyColor: AppColors.color8484.withOpacity(0.3),
                emptyIcon: Icons.star_border,
                onRatingChanged: (value) => debugPrint('$value'),
                initialRating: 0,
                maxRating: 5,
              ),
              SizedBox(
                height: 20.h,
              ),
              customFilterText(text: "Share Your Thoughts!"),
              SizedBox(
                height: 12.h,
              ),
              TextFormField(
                maxLines: 3,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: FontFamily.helvetica,
                    color: AppColors.color8F90),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(
                            color: AppColors.color2E2E.withOpacity(0.2))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(
                            color: AppColors.color2E2E.withOpacity(0.2))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.sp),
                        borderSide: BorderSide(
                            color: AppColors.color2E2E.withOpacity(0.2))),
                    labelText: "Message",
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontFamily.helvetica,
                        color: AppColors.color8585)),
              ),
              // const Spacer(),
              SizedBox(
                height: 40.h,
              ),
              customButton(
                  ontap: () {
                    Get.back();
                  },
                  text: "Send"),
              SizedBox(
                height: 10.h,
              ),
              // customButton(
              //     ontap: () {Get.},
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
      ),
    );
  }
}
