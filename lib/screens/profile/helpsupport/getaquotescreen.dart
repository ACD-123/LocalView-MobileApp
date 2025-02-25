import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class GetAQuoteScreen extends StatefulWidget {
  const GetAQuoteScreen({super.key});

  @override
  State<GetAQuoteScreen> createState() => _GetAQuoteScreenState();
}

class _GetAQuoteScreenState extends State<GetAQuoteScreen> {
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
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  "Do You Have Any Queries?",
                  style: TextStyle(
                    color: AppColors.maincolor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Enter Your Detail Below",
                  style: TextStyle(
                    color: AppColors.color9494,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              customTextFormField(
                  hinttext: "Nicolas Wade", fieldtitle: "Full Name"),
              SizedBox(
                height: 15.h,
              ),
              customTextFormField(
                  hinttext: "nicolas@gmail.com", fieldtitle: "Email Address"),
              SizedBox(
                height: 15.h,
              ),
              customTextFormField(
                  hinttext: " 123 456 789 0",
                  fieldtitle: "Phone",
                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                  keyboardType: TextInputType.number),
              SizedBox(
                height: 15.h,
              ),
              customTextFormField(
                  lines: 3, hinttext: "Message", fieldtitle: "Message"),
              SizedBox(
                height: 25.h,
              ),
              customButton(
                  ontap: () {
                    Get.back();
                  },
                  text: "Send")
            ],
          ),
        ),
      ),
    );
  }
}
