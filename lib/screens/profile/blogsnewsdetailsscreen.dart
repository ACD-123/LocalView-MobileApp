import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';

class BlogsNewsDetailsScreen extends StatefulWidget {
  const BlogsNewsDetailsScreen({super.key});

  @override
  State<BlogsNewsDetailsScreen> createState() => _BlogsNewsDetailsScreenState();
}

class _BlogsNewsDetailsScreenState extends State<BlogsNewsDetailsScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: "Blog and News",
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.asset(
                    "assets/images/blogsdetailimage.png",
                    height: 180.h,
                    width: Get.width,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.colorF2F2,
                        borderRadius: BorderRadius.circular(4.sp)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                      child: Center(
                        child: Text(
                          "Technology",
                          style: TextStyle(
                              color: AppColors.color2C2C,
                              fontFamily: FontFamily.cairo,
                              fontSize: 8.sp),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Jan 1, 2021",
                    style: TextStyle(
                        color: AppColors.color8282,
                        fontFamily: FontFamily.cairo,
                        fontSize: 9.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Icon(
                      Icons.circle,
                      size: 3.sp,
                      color: AppColors.color8282,
                    ),
                  ),
                  Text(
                    '3344 views',
                    style: TextStyle(
                        color: AppColors.color8282,
                        fontFamily: FontFamily.cairo,
                        fontSize: 9.sp),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "New VR Headsets That Will Shape the Metaverse",
                style: TextStyle(
                    color: AppColors.color2C2C,
                    fontFamily: FontFamily.helvetica,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/blogprofileimage.png",
                    height: 30.h,
                    width: 30.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "By: ",
                        style: TextStyle(
                          color: AppColors.color3333,
                          fontFamily: FontFamily.helvetica,
                          fontSize: 12.sp,
                        ),
                      ),
                      TextSpan(
                        text: "Mason Eduard",
                        style: TextStyle(
                          color: AppColors.color3333,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.color3333,
                          fontFamily: FontFamily.helvetica,
                          fontSize: 12.sp,
                        ),
                      )
                    ])),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/shareboxicon.png",
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequat porta eu ultrices feugiat. Et, faucibus ut amet turpis. Facilisis faucibus semper cras purus.",
                style: TextStyle(
                  color: AppColors.color2C2C,
                  fontFamily: FontFamily.helvetica,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. ",
                style: TextStyle(
                  color: AppColors.color2C2C,
                  fontFamily: FontFamily.helvetica,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id sit eu tellus sed cursus eleifend id porta. Lorem adipiscing mus vestibulum consequat porta eu ultrices feugiat. Et, faucibus ut amet turpis. Facilisis faucibus semper cras purus.",
                style: TextStyle(
                  color: AppColors.color2C2C,
                  fontFamily: FontFamily.helvetica,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
