import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';

Container customButton({
  required VoidCallback ontap,
  required String text,
  BoxShadow? boxshadow,
  dynamic height,
  dynamic width,
  dynamic fontsize,
  dynamic borderradius,
  Color? buttoncolor,
  Color? bordercolor,
  Color? textcolor,
}) {
  return Container(
    height: height ?? 45.h,
    width: width ?? Get.width,
    decoration: BoxDecoration(
        boxShadow: [
          boxshadow ??
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 8,
                  offset: const Offset(4, 0))
        ],
        border: bordercolor == null ? null : Border.all(color: bordercolor),
        borderRadius: BorderRadius.circular(borderradius ?? 30.sp),
        color: buttoncolor ?? AppColors.maincolor),
    child: Material(
      shadowColor: Colors.grey.withOpacity(0.001),
      borderRadius: BorderRadius.circular(borderradius ?? 30.sp),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(borderradius ?? 30.sp),
        onTap: ontap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontsize ?? 14.sp,
                fontFamily: FontFamily.helvetica,
                color: textcolor ?? AppColors.white),
          ),
        ),
      ),
    ),
  );
}
