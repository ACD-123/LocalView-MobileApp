import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localview/constants/appcolors.dart';

class customRatingIndicatorLine extends StatelessWidget {
  final double rating;
  final int maxRating;
  final String label;

  customRatingIndicatorLine({
    required this.rating,
    required this.maxRating,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    double progress = rating / maxRating;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 32.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppColors.helvetica,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 0.5.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress, // Controls the progress bar width
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: AppColors()
                    .customappgradient(), // Gradient for the progress bar
              ),
            ),
          ),
        ),
        Text(
          "$rating", // Display rating as a string
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppColors.helvetica,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
