import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customsnackbar.dart';

class HomeSearchScreen extends StatefulWidget {
  const HomeSearchScreen({super.key});

  @override
  State<HomeSearchScreen> createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  final String? screentype = Get.arguments as String?;
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: screentype == "searchhistory"
            ? customAppBar(
                title: "Search History",
                ontap: () {
                  Get.back();
                })
            : null,
        bottomNavigationBar: screentype == "searchhistory"
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: customButton(
                    ontap: () {
                      authcontroller.searchistorylist.clear();
                    },
                    text: "Clear History"),
              )
            : const SizedBox(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              screentype == "searchhistory"
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 35.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              size: 25.sp,
                              color: AppColors.maincolor,
                            ),
                          ),
                          Container(
                            height: 40.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.2),
                                      offset: const Offset(0, 2),
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 13.w,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 20.sp,
                                    color: AppColors.color2E2E.withOpacity(0.2),
                                  ),
                                  SizedBox(
                                    width: 225.w,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search here",
                                          hintStyle: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: FontFamily.helvetica,
                                              color: AppColors.color2E2E
                                                  .withOpacity(0.4))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      customSnackBar(message: "Coming Soon");
                                    },
                                    child: Icon(Icons.mic_rounded,
                                        size: 20.sp,
                                        color: AppColors.maincolor),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: 10.h,
              ),
              SingleChildScrollView(
                  child: Obx(
                () => Column(
                  children: List.generate(
                      authcontroller.searchistorylist.length, (index) {
                    final seachdata = authcontroller.searchistorylist[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 12.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: seachdata['title'] == null ||
                                    seachdata['title'].toString().isEmpty
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.history,
                                color: AppColors.maincolor,
                                size: 25.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    seachdata['title'] == null ||
                                            seachdata['title']
                                                .toString()
                                                .isEmpty
                                        ? const SizedBox()
                                        : Text(
                                            seachdata['title'],
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    FontFamily.helvetica,
                                                color: AppColors.black),
                                          ),
                                    Text(
                                      seachdata['subtitle'],
                                      style: TextStyle(
                                          fontSize:
                                              seachdata['title'] == null ||
                                                      seachdata['title']
                                                          .toString()
                                                          .isEmpty
                                                  ? 12.sp
                                                  : 10.sp,
                                          fontFamily: FontFamily.helvetica,
                                          color: AppColors.color8F87),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.black.withOpacity(0.1),
                        )
                      ],
                    );
                  }),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
