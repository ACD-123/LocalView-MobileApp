import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localview/constants/appcolors.dart';

Row customRatingWidget({
  required int rating,
  dynamic size
  
}){
  return  Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: index < rating ? AppColors.colorFDD8 : AppColors. color8484,
          size: size ?? 16.sp,
        ),
      ),
  );
}