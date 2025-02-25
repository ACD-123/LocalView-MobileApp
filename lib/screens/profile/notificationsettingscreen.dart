import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customSwitchbutton.dart';
import 'package:localview/customwidgets/customappbar.dart';

class NotificationsSettingScreen extends StatefulWidget {
  const NotificationsSettingScreen({super.key});

  @override
  State<NotificationsSettingScreen> createState() =>
      _NotificationsSettingScreenState();
}

class _NotificationsSettingScreenState
    extends State<NotificationsSettingScreen> {
  final componentcontroller = Get.put(ComponentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Notifications Setting',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
            child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSwitchButtonTitle(
                  title: "Real-time Updates",
                  fieldtext: "Booking confirmations, flight changes",
                  isSwitchOn: componentcontroller.realupdatenotificationSetting,
                  onChanged: (value) {
                    componentcontroller
                        .updaterealupdatenotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Promotions and Deals",
                  fieldtext: "Discounted Offers",
                  isSwitchOn:
                      componentcontroller.promtiondealsnotificationSetting,
                  onChanged: (value) {
                    componentcontroller
                        .updatePromtiondealsnotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Reminders Alerts",
                  fieldtext: "Reminders for upcoming",
                  isSwitchOn:
                      componentcontroller.reminderalertsnotificationSetting,
                  onChanged: (value) {
                    componentcontroller
                        .updateReminderAlertsnotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

///////////
Column customSwitchButtonTitle({
  required String title,
  required String fieldtext,
  required RxBool isSwitchOn,
  required Function(bool) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
            fontFamily: FontFamily.helvetica,
            fontSize: 12.sp,
            color: AppColors.black),
      ),
      SizedBox(
        height: 8.h,
      ),
      Container(
        height: 50.h,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.sp),
            border: Border.all(color: AppColors.color2E2E.withOpacity(0.2))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fieldtext,
                style: TextStyle(
                    fontFamily: FontFamily.helvetica,
                    fontSize: 11.sp,
                    color: AppColors.color9494),
              ),
              customSwitchButton(value: isSwitchOn, onChanged: onChanged),
            ],
          ),
        ),
      ),
    ],
  );
}
