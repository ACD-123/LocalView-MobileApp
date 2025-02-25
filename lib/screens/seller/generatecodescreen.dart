import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';
import 'package:localview/helpers/routeconstants.dart';

class GeneratePromoCodeScreen extends StatefulWidget {
  const GeneratePromoCodeScreen({super.key});

  @override
  State<GeneratePromoCodeScreen> createState() =>
      _GeneratePromoCodeScreenState();
}

class _GeneratePromoCodeScreenState extends State<GeneratePromoCodeScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  // Function to show Date Picker for Start Date

  // Function to show Date Picker for Start Date
  Future<void> _selectStartDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // You can adjust this range
      lastDate: DateTime(2101), // You can adjust this range
    );

    if (selectedDate != null) {
      // Format the selected date to the required format (e.g., dd-MM-yyyy)
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      // Set the formatted date in the controller
      startDateController.text = formattedDate;
    }
  }

  // Function to show Date Picker for End Date
  Future<void> _selectEndDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // You can adjust this range
      lastDate: DateTime(2101), // You can adjust this range
    );

    if (selectedDate != null) {
      // Format the selected date to the required format (e.g., dd-MM-yyyy)
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

      // Set the formatted date in the controller
      endDateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Generate Promo Code',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coupon Name",
                style: TextStyle(
                  fontFamily: FontFamily.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                editingController: TextEditingController(),
                validator: (v) {
                  // if (v == null || v.isEmpty) {
                  //   return 'Business Name can\'t be empty';
                  // }
                  return null;
                },
                hintText: 'abcd',
              ),
              SizedBox(height: 15.h),
              Text(
                "Dish Code",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                enabled: true,
                editingController: TextEditingController(),
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return 'Email can\'t be empty';
                  // } else if (!v.isEmail) {
                  //   return 'Invalid Email';
                  // }
                  return null;
                },
                hintText: '2cd1v5v1r1',
              ),
              SizedBox(height: 15.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Start Date Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount Start Date",
                          style: TextStyle(
                            fontFamily: AppColors.helvetica,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: _selectStartDate, // Trigger date picker
                          child: AbsorbPointer(
                            child: CustomTextField(
                              editingController: startDateController,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Start date can\'t be empty';
                                }
                                return null;
                              },
                              hintText: 'Select Date',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  // End Date Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount End Date",
                          style: TextStyle(
                            fontFamily: AppColors.helvetica,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: _selectEndDate, // Trigger date picker
                          child: AbsorbPointer(
                            child: CustomTextField(
                              editingController: endDateController,
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'End date can\'t be empty';
                                }
                                return null;
                              },
                              hintText: 'Select Date',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                "Min Order",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                enabled: true,
                editingController: TextEditingController(),
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return 'Email can\'t be empty';
                  // } else if (!v.isEmail) {
                  //   return 'Invalid Email';
                  // }
                  return null;
                },
                inputFormatter: FilteringTextInputFormatter.digitsOnly,
                keyboardtype: TextInputType.number,
                hintText: '\$100',
              ),
              SizedBox(height: 15.h),
              Text(
                "Max Discount",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(height: 1.h),
              CustomTextField(
                enabled: true,
                editingController: TextEditingController(),
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return 'Email can\'t be empty';
                  // } else if (!v.isEmail) {
                  //   return 'Invalid Email';
                  // }
                  return null;
                },
                keyboardtype: TextInputType.number,
                inputFormatter: FilteringTextInputFormatter.digitsOnly,
                hintText: '\$100',
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
                  Get.toNamed(RouteConstants.promotionsandoffer);
                },
                buttonName: 'Generate',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
