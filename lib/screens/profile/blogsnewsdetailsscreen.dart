import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/controller/userprofilecontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customsnackbar.dart';

class BlogsNewsDetailsScreen extends StatefulWidget {
  const BlogsNewsDetailsScreen({super.key});

  @override
  State<BlogsNewsDetailsScreen> createState() => _BlogsNewsDetailsScreenState();
}

class _BlogsNewsDetailsScreenState extends State<BlogsNewsDetailsScreen> {
  final componentcontroller = Get.put(ComponentController());
  final userprofilecontroller =
      Get.put(UserProfileController(userProfileRepo: Get.find()));
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
          child: Obx(() =>
          userprofilecontroller.getblogbyidloading.value ? 
          Center(child: customCircularProgress(),) : 
          userprofilecontroller.getblogbyid.value == null ||
          userprofilecontroller.getblogbyid.value?.data == null ||
          userprofilecontroller.getblogbyid.value?.data?.blog == null?
          Center(child: customNotDataText(text: "Blog Details Not Available"),) :

          
          
          
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15.sp),
                  child: Image.network(
                     userprofilecontroller.getblogbyid.value?.data?.blog?.image == null ||
                      userprofilecontroller.getblogbyid.value!.data!.blog!.image!.isEmpty ? 
                       AppConstants.noimage : 
                    userprofilecontroller.getblogbyid.value?.data?.blog?.image
                            .toString() ??
                        AppConstants.noimage,
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
                          userprofilecontroller
                                  .getblogbyid.value?.data?.blog?.category?.name
                                  .toString() ??
                              "",
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
                    blogDateFormate(userprofilecontroller.getblogbyid.value?.data?.blog?.publishDate.toString() ?? ""),
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
                    '${userprofilecontroller.getblogbyid.value?.data?.blog?.views.toString() ?? ""} views',
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
                userprofilecontroller.getblogbyid.value?.data?.blog?.title
                        .toString() ??
                    "",
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
                  Image.network(
                    userprofilecontroller.getblogbyid.value?.data?.blog?.user == null ||
                    userprofilecontroller.getblogbyid.value?.data?.blog?.user?.media == null ||
                    userprofilecontroller.getblogbyid.value!.data!.blog!.user!.media! .isEmpty ?
                    AppConstants.noprofileimage : 
                    userprofilecontroller.getblogbyid.value?.data?.blog?.user?.media?.first.originalUrl.toString() ?? 
                    AppConstants.noprofileimage
                    ,
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
                        text:
                            "${userprofilecontroller.getblogbyid.value?.data?.blog?.user?.firstName.toString() ?? ""} ${
                          userprofilecontroller
                                  .getblogbyid.value?.data?.blog?.user?.lastName
                                  .toString() ??
                              ""
                        }",
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
                    onTap: () {
                      customSnackBar(message: "Coming Soon");
                    },
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
                userprofilecontroller.getblogbyid.value?.data?.blog?.description
                        .toString() ??
                    "",
                style: TextStyle(
                  color: AppColors.color2C2C,
                  fontFamily: FontFamily.helvetica,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),)
        ),
      ),
    );
  }
}


////////////blog date format
blogDateFormate(String dateString){
   DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat("MMM d, y").format(date);
  return formattedDate;
}