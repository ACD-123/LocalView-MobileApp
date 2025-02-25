import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Customer Support',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Do You Have Any Queries?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.lineargradient1,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppColors.joan,
                  ),
                ),
              ),
              Center(
                child: Text("Enter Your Detail Below",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: AppColors.joan,
                    )),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Full Name",
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
                    return 'Business Name can\'t be empty';
                  }
                  return null;
                },
                hintText: 'Le Château de Luxe',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Email Address",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                enabled: true,
                editingController: TextEditingController(),
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Email can\'t be empty';
                  } else if (!v.isEmail) {
                    return 'Invalid Email';
                  }
                  return null;
                },
                hintText: 'leChâteaudeluxe@gmail.com',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Phone",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                keyboardtype: TextInputType.number,
                inputFormatter: FilteringTextInputFormatter.digitsOnly,
                editingController: TextEditingController(),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Phone can\'t be empty';
                  }
                  return null;
                },
                hintText: 'Enter Your Phone Number',
              ),
              SizedBox(height: 15.h),
              Text(
                "Message",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 120,
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greytheme, width: 1.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller:
                        businessController.businessDescriptionController,
                    maxLines: 5, // To allow multi-line input
                    decoration: InputDecoration(
                      hintText: "Write something about your business",
                      border: InputBorder.none, // Remove default border
                      hintStyle: TextStyle(color: Colors.grey),
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
                },
                buttonName: 'Send',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
