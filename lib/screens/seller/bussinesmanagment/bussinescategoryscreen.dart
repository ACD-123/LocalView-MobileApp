import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';

class BusinessCategoryScreen extends StatefulWidget {
  BusinessCategoryScreen({super.key});

  @override
  _BusinessCategoryScreenState createState() => _BusinessCategoryScreenState();
}

class _BusinessCategoryScreenState extends State<BusinessCategoryScreen> {
  // Dropdown value and categories
  String? selectedCategory;
  final List<String> categories = [
    'Restaurant',
    'Retail',
    'Service',
    'Education',
    'Health',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Business Category',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.lineargradient1,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(30), // Circular border
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                  isExpanded: true, // Ensures the dropdown takes full width
                  dropdownColor:
                      Colors.white, // Make the dropdown background white
                  iconEnabledColor:
                      AppColors.lineargradient1, // Dropdown icon color
                  underline: Container(), // Remove the underline
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: AppColors.helvetica,
                        ),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    'Select Category',
                    style: TextStyle(
                      color: AppColors.lineargradient1,
                      fontSize: 15,
                      fontFamily: AppColors.joan,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevetedButton(
              gradientColors: [
                AppColors.lineargradient1,
                AppColors.lineargradient2
              ],
              textColor: Colors.white,
              ontap: () {
                Get.back();
                // if (loginController
                //         .signupemailverificationotp.value.isEmpty ||
                //     loginController
                //             .signupemailverificationotp.value.length <
                //         5) {
                //   showErrrorSnackbar(
                //       message: 'Please enter a 5-digit code.');
                // } else {
                //   loginController.emailVerification(
                //     type: "1",
                //     otp: loginController
                //         .signupemailverificationotp.value
                //         .toString(),
                //     isUser: isUser,
                //     email: email,
                //     context: context,
                //   );
                // }
              },
              buttonName: 'Update',
            ),
          ],
        ),
      ),
    );
  }
}
