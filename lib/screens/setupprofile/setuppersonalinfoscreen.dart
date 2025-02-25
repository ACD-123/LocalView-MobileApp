import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class SetupPersonalInfoScreen extends StatefulWidget {
  const SetupPersonalInfoScreen({super.key});

  @override
  State<SetupPersonalInfoScreen> createState() =>
      _SetupPersonalInfoScreenState();
}

class _SetupPersonalInfoScreenState extends State<SetupPersonalInfoScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Personal Info",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: FontFamily.joan,
                  color: AppColors.maincolor),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Text(
              "Fill the information below.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.helvetica,
                  color: AppColors.color9494),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 160.w,
                child: customTextFormField(
                    fieldtitle: "First Name", hinttext: "Jade"),
              ),
              SizedBox(
                width: 160.w,
                child: customTextFormField(
                    fieldtitle: "Last Name", hinttext: "Nicolas"),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          customTextFormField(
              fieldtitle: "Email Address", hinttext: "nicolas@gmail.com"),
          SizedBox(
            height: 10.h,
          ),
          customTextFormField(
              fieldtitle: "Phone", hinttext: "Enter Your Phone Number"),
 SizedBox(
            height: 10.h,
          ),
          customButton(ontap: (){

          }, text: "")

        ],
      ),
    );
  }
}
