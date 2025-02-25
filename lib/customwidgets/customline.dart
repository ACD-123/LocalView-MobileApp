import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localview/constants/appcolors.dart';

Container customLine({
  dynamic height,
  dynamic width
}){
  return  Container(
            height:height ??  5.5.h,
            width:width ?? 50.w,
            decoration: BoxDecoration(
              color: AppColors.maincolor,
              borderRadius: BorderRadius.circular(12.sp)
            ),
          );
}