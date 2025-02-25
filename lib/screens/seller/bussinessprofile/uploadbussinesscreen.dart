import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';

class UploadbusinesScreen extends StatelessWidget {
  const UploadbusinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    'Branding & Media',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppColors.joan,
                        color: AppColors.textcolor),
                  ),
                ),
                Center(
                  child: Text(
                    "Upload Photos from your gallery.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greytheme,
                      fontFamily: AppColors.helvetica,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Business Logo",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey)),
                  height: 90.h,
                  width: 140.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/imageicon.png",
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Upload Logo",
                        style: TextStyle(
                            fontFamily: AppColors.helvetica,
                            fontSize: 13.sp,
                            color: Colors.grey),
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
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.grey)),
                      height: 90.h,
                      width: 140.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/videoicon.svg",
                            height: 15.h,
                            width: 15.w,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "Add Video",
                            style: TextStyle(
                                fontFamily: AppColors.helvetica,
                                fontSize: 13.sp,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.grey)),
                      height: 90.h,
                      width: 140.w,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 11.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/imageicon.png",
                              height: 20.h,
                              width: 20.w,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Add Images",
                              style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 13.sp,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
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
                SizedBox(
                  height: 15.h,
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
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1, color: Colors.grey)),
                  height: 160.h,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/covericon.png",
                        height: 30.h,
                        width: 35.w,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
