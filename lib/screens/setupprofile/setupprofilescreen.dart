// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/helpers/routeconstants.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  _SetupProfileScreenState createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Obx(
          () => Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: authcontroller.pageController,
                  itemCount: authcontroller.setupProfilepages.length,
                  onPageChanged: (index) {
                    authcontroller.setupprofilecurrentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return authcontroller.setupProfilepages[index];
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        authcontroller.setupProfilepages.length,
                        (index) => _buildPageIndicator(index ==
                            authcontroller.setupprofilecurrentPage.value),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteConstants.homescreen);
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: FontFamily.helvetica,
                                color: AppColors.maincolor),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: authcontroller.setupprofilegoToNextPage,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: AppColors.maincolor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lineargradient1 : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
