import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';

AppBar customAppBar({required String title, required VoidCallback ontap}) {
  return AppBar(
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    backgroundColor: Colors.white,
    leading: GestureDetector(
        onTap: ontap,
        child: Icon(
          Icons.close,
          size: 22.sp,
          color: AppColors.maincolor,
        )),
    title: Text(
      title,
      style: TextStyle(
          fontFamily: FontFamily.joan,
          color: AppColors.color1212,
          fontSize: 17.sp),
    ),
  );
}
