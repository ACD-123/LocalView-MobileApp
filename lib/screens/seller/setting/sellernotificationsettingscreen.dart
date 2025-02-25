import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/screens/profile/notificationsettingscreen.dart';

class SellerNotificationsSettingScreen extends StatefulWidget {
  const SellerNotificationsSettingScreen({super.key});

  @override
  State<SellerNotificationsSettingScreen> createState() =>
      _SellerNotificationsSettingScreenState();
}

class _SellerNotificationsSettingScreenState
    extends State<SellerNotificationsSettingScreen> {
  final businesscontroller = Get.put(BusinessController());

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
                  isSwitchOn:
                      businesscontroller.sellerrealupdatenotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerrealupdatenotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Promotions and Deals",
                  fieldtext: "Discounted Offers",
                  isSwitchOn:
                      businesscontroller.sellerpromtiondealsnotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerPromtiondealsnotificationSettingSwitch(
                            value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Messages",
                  fieldtext: "Any Kind Of Messaging",
                  isSwitchOn:
                      businesscontroller.sellerMessagenotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerMessagenotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Reviews",
                  fieldtext: "Reviews Alerts",
                  isSwitchOn:
                      businesscontroller.sellerReviewnotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerReviewnotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Bookings",
                  fieldtext: "Booking Notifications",
                  isSwitchOn:
                      businesscontroller.sellerBookingnotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerBookingnotificationSettingSwitch(value);
                  }),
              SizedBox(
                height: 15.h,
              ),
              customSwitchButtonTitle(
                  title: "Reminders Alerts",
                  fieldtext: "Reminders for upcoming",
                  isSwitchOn: businesscontroller
                      .sellerreminderalertsnotificationSetting,
                  onChanged: (value) {
                    businesscontroller
                        .updatesellerReminderAlertsnotificationSettingSwitch(
                            value);
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
