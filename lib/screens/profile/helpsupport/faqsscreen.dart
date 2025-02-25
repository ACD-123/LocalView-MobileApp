import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/home/filterscreen.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'FAQs',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customFilterText(text: "Questions"),
              SizedBox(
                height: 12.h,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: componentcontroller.faqsquestion.length,
                  itemBuilder: ((context, index) {
                    final faqdata = componentcontroller.faqsquestion[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.sp),
                            border: Border.all(
                                color: AppColors.color2E2E.withOpacity(0.2))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  faqdata,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontFamily: FontFamily.helvetica,
                                      fontSize: 12.sp,
                                      color: AppColors.black),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteConstants.faqsdetailscreen,
                                      arguments: faqdata);
                                },
                                child: Text(
                                  "Get Answer",
                                  style: TextStyle(
                                      fontFamily: FontFamily.helvetica,
                                      fontSize: 12.sp,
                                      color: AppColors.maincolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
