import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/emailtextfield.dart';
class AddAddressScreem extends StatelessWidget {
  const AddAddressScreem({super.key});

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
                    'Add Address',
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
                  hintText: 'Enter Your Current Address',
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Country",
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
                      return 'Country can\'t be empty';
                    }
                    return null;
                  },
                  hintText: 'United State of America',
                ),
                SizedBox(height: 15.h),
                Text(
                  "City",
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
                      return 'City can\'t be empty';
                    }
                    return null;
                  },
                  hintText: 'New York',
                ),
                SizedBox(height: 15.h),
                Text(
                  "Zip Code",
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
                      return 'Zip Code can\'t be empty';
                    }
                    return null;
                  },
                  hintText: '75500',
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteConstants.addadressmapscreen);
                  },
                  child: Text(
                    "Add Address Directly from Map",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // ElevetedButton(
                //   gradientColors: [
                //     AppColors.lineargradient1,
                //     AppColors.lineargradient2
                //   ],
                //   textColor: Colors.white,
                //   ontap: () {
                //     // Get.toNamed(RouteConstants.addadresscreen);
                //   },
                //   buttonName: 'Confirm',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
