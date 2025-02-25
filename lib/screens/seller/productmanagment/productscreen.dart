import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localview/constants/appcolors.dart';

class CreatProduct extends StatelessWidget {
  const CreatProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 9.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/maki_cross.svg",
                ),
                Expanded(
                  child: Text(
                    'Product Management',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppColors.joan,
                    ),
                  ),
                ),
              ],
            ),
            // Size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Visitors and Revenue containers
                Container(
                  height: 17.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F1F1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total\nProducts",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                            Image.asset("assets/arrowtop.png")
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "411",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff46D746),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 25,
                              width: 12.w,
                              child: Center(child: Text("+2%")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 17.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                      color: Color(0xffF4F1F1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total\nRevenue",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/arrowbottom.svg",
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$43,321",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffE55353),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 25,
                              width: 12.w,
                              child: Center(child: Text("-1.5%")),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
