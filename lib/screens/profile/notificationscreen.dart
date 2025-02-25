import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Notifications',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
                  componentcontroller.notificationlist.length, (index) {
            final notificationdata =
                componentcontroller.notificationlist[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.black.withOpacity(0.2))),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: Center(
                              child: Image.asset(
                            notificationdata['image'],
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.fill,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: 280.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 230.w,
                                    child: Text(
                                      notificationdata['title'],
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: FontFamily.helvetica,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.black),
                                    )),
                                Text(
                                  notificationdata['time'],
                                  style: TextStyle(
                                      fontSize: 9.sp,
                                      fontFamily: FontFamily.cairo,
                                      color: AppColors.maincolor),
                                ),
                              ],
                            ),
                            Text(
                              notificationdata['description'],
                              style: TextStyle(
                                  fontSize: 11.sp,
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
          })),
        ),
      ),
    );
  }
}
