import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';

customCircularProgress() {
  return const CircularProgressIndicator(
    color: AppColors.maincolor,
  );
}

/////////custom not data text
customNotDataText({
  required String text,
}) {
  return Text(text,
      style: TextStyle(
          fontSize: 13.sp,
          color: AppColors.maincolor,
          fontFamily: FontFamily.helvetica,
          fontWeight: FontWeight.bold));
}

//////////////dummy loader
Container customDummyLoader({
  dynamic height,
  dynamic width,
  Color? color,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.sp),
      color: color ?? AppColors.black.withOpacity(0.04),
    ),
    height: height ?? 50.h,
    width: width ?? Get.width,
  );
}
