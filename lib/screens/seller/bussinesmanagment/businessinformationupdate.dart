import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class BusinessUpdateInformation extends StatefulWidget {
  const BusinessUpdateInformation({super.key});

  @override
  State<BusinessUpdateInformation> createState() =>
      _BusinessUpdateInformationState();
}

class _BusinessUpdateInformationState extends State<BusinessUpdateInformation> {
  // Controllers for opening and closing time
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();
  final BusinessController businessController = Get.put(BusinessController());

  // Dropdown value for selected days
  String? selectedDays;

  // List of day options for the dropdown
  final List<String> daysOptions = [
    "Monday - Friday",
    "Monday - Thursday",
    "Tuesday - Friday",
    "Monday - Saturday",
    "Wednesday - Sunday",
  ];

  // Function to show time picker for opening time
  void _selectOpeningTime() async {
    TimeOfDay selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ) ??
        TimeOfDay.now();

    // Set the selected time into the text field
    openingTimeController.text = selectedTime.format(context);
  }

  // Function to show time picker for closing time
  void _selectClosingTime() async {
    TimeOfDay selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ) ??
        TimeOfDay.now();

    // Set the selected time into the text field
    closingTimeController.text = selectedTime.format(context);
  }

  @override
  void initState() {
    super.initState();

    // Reset all fields when the page is initialized or revisited
    _clearAllFields();
  }

  // Function to clear all fields
  void _clearAllFields() {
    openingTimeController.clear();
    closingTimeController.clear();
    businessController.businessDescriptionController.clear();
    setState(() {
      selectedDays = null; // Reset the dropdown
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Business Information',
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Business Name",
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
                suffixIcon: Image.asset(
                  "assets/editicon.png",
                  height: 24, // Adjust the height here
                  width: 24, // You can also adjust the width if needed
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Business Email Address",
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
              SizedBox(height: 15.h),
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
                editingController: TextEditingController(),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Phone can\'t be empty';
                  }
                  return null;
                },
                suffixIcon: Image.asset(
                  "assets/editicon.png",
                  height: 24, // Adjust the height here
                  width: 24, // You can also adjust the width if needed
                ),
                hintText: 'Enter Your Phone Number',
              ),
              SizedBox(height: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h),
                  Text(
                    "Business Info",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 120,
                    width: Get.width,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.greytheme, width: 1.0),
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
                    height: 25.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
