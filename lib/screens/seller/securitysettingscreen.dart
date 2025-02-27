import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

Widget customerplan(
    String text, bool switchValue, ValueChanged<bool> onChanged) {
  return Container(
    height: 55.h,
    width: Get.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
        )),
    child: Padding(
      padding: EdgeInsets.all(8.0), // Padding for better spacing
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between widgets
        children: [
          // Display the price with text
          Text(
            text,
            style: TextStyle(fontSize: 15, fontFamily: FontFamily.helvetica),
          ),
          // Switch widget to toggle on/off
          Switch(
            value: switchValue,
            onChanged: onChanged,
            activeColor:
                AppColors.lineargradient1, // Optional: Customize switch color
            inactiveThumbColor: Colors.grey, // Customize inactive color
          ),
        ],
      ),
    ),
  );
}

class _SecurityScreenState extends State<SecurityScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;
  bool _isPlanActive = false;

  void _onSwitchChanged(bool value) {
    setState(() {
      _isPlanActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Security Setting',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: customerplan(
                "Set up two-factor authentication", // Price text

                _isPlanActive, // Current switch state
                _onSwitchChanged, // Callback for switch state change
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteConstants.inappchangepasswordscreen);
              },
              child: Container(
                height: 55.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 3.w),
                      SvgPicture.asset(
                        "assets/paswordicon.svg",
                        height: 24
                            .h, // You can adjust the height as per your design
                        width: 24.w, // Similarly, adjust the width if needed
                      ),
                      SizedBox(width: 3.w),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              fontSize: 14, fontFamily: FontFamily.helvetica),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // ElevetedButton(
            //   gradientColors: [
            //     AppColors.lineargradient1,
            //     AppColors.lineargradient2
            //   ],
            //   textColor: Colors.white,
            //   ontap: () {
            //     Get.back();
            //   },
            //   buttonName: 'Send',
            // ),
          ],
        ),
      ),
    );
  }
}
