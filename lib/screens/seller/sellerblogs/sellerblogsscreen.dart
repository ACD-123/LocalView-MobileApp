import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';

class SelllerBlogsNewsScreen extends StatefulWidget {
  const SelllerBlogsNewsScreen({super.key});

  @override
  State<SelllerBlogsNewsScreen> createState() => _SelllerBlogsNewsScreenState();
}

class _SelllerBlogsNewsScreenState extends State<SelllerBlogsNewsScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.maincolor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(RouteConstants.addnewblogscreen);
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: AppColors.white,
        ),
      ),
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
              Obx(
                () => SizedBox(
                  height: 35.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          componentcontroller.blogsnewslist.length, (index) {
                        final favcategorydata =
                            componentcontroller.blogsnewslist[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: customCatgegorySelectedContainer(
                            ontap: () {
                              componentcontroller
                                  .blogsnewsselectedcategory.value = index;
                            },
                            image: "",
                            title: favcategorydata['name'],
                            isSelected: componentcontroller
                                    .blogsnewsselectedcategory.value ==
                                index,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: componentcontroller.blogsnewlist.length,
                  itemBuilder: (context, index) {
                    final blogsnewdata =
                        componentcontroller.blogsnewlist[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteConstants.sellerblognewdetailscreen);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15.sp),
                                child: Image.asset(
                                  blogsnewdata['image'],
                                  height: 75.h,
                                  width: 90.w,
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            SizedBox(
                              width: 230.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.colorF2F2,
                                            borderRadius:
                                                BorderRadius.circular(4.sp)),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.sp),
                                          child: Center(
                                            child: Text(
                                              blogsnewdata['category'],
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
                                        blogsnewdata['date'],
                                        style: TextStyle(
                                            color: AppColors.color8282,
                                            fontFamily: FontFamily.cairo,
                                            fontSize: 9.sp),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        child: Icon(
                                          Icons.circle,
                                          size: 3.sp,
                                          color: AppColors.color8282,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 55.w,
                                        child: Text(
                                          '${blogsnewdata['views']} views',
                                          style: TextStyle(
                                              color: AppColors.color8282,
                                              fontFamily: FontFamily.cairo,
                                              fontSize: 9.sp),
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    blogsnewdata['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AppColors.color2C2C,
                                        fontFamily: FontFamily.cairobold,
                                        fontSize: 14.sp),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
