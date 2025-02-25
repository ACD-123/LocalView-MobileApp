import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class AddAddressMapScreem extends StatefulWidget {
  const AddAddressMapScreem({super.key});

  @override
  State<AddAddressMapScreem> createState() => _AddAddressMapScreemState();
}

class _AddAddressMapScreemState extends State<AddAddressMapScreem> {
  final loginController =
      Get.put(AuthenticationController(authRepo: Get.find()));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    'Add Business Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppColors.joan,
                        color: AppColors.textcolor),
                  ),
                ),
                Center(
                  child: Text(
                    "Enter your current Address.",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.greytheme,
                      fontFamily: AppColors.helvetica,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Image.asset("assets/googlemapimage.png"),
                SizedBox(height: 15.h),
                Text(
                  "Address",
                  style: TextStyle(
                    fontFamily: AppColors.helvetica,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  editingController: TextEditingController(),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Address can\'t be empty';
                    }
                    return null;
                  },
                  hintText: 'Address',
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevetedButton(
                  gradientColors: [
                    AppColors.lineargradient1,
                    AppColors.lineargradient2
                  ],
                  textColor: Colors.white,
                  ontap: () {
                    Get.back();
                  },
                  buttonName: 'Confirm',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
