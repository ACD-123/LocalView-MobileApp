import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
