import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/profile/settingscreen.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Help & Support',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              settingTabContainer(
                title: "About Us",
                ontap: () {
                  Get.toNamed(RouteConstants.aboutusscreen);
                },
                image: "assets/images/aboutusicon.png",
              ),
              SizedBox(
                height: 10.h,
              ),
              settingTabContainer(
                image: "assets/images/faqicon.png",
                title: "FAQs",
                ontap: () {
                  Get.toNamed(RouteConstants.faqsscreen);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              settingTabContainer(
                  title: "Get a Quote",
                  ontap: () {
                    Get.toNamed(RouteConstants.getaquotescreen);
                  },
                  icon: Icons.phone),
            ],
          ),
        ),
      ),
    );
  }
}
