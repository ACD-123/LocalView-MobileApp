import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class BusinessHoursScreen extends StatefulWidget {
  const BusinessHoursScreen({super.key});

  @override
  State<BusinessHoursScreen> createState() => _BusinessHoursScreenState();
}

class _BusinessHoursScreenState extends State<BusinessHoursScreen> {
  // Dropdown value for selected days
  String? selectedDays;
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();
  final BusinessController businessController = Get.put(BusinessController());

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
    // _clearAllFields();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Business Hours',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Opening Time",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: _selectOpeningTime, // Trigger time picker
                        child: AbsorbPointer(
                          child: CustomTextField(
                            editingController: openingTimeController,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Opening Time can\'t be empty';
                              }
                              return null;
                            },
                            hintText: 'Select Time',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Closing Time",
                        style: TextStyle(
                          fontFamily: AppColors.helvetica,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: _selectClosingTime, // Trigger time picker
                        child: AbsorbPointer(
                          child: CustomTextField(
                            editingController: closingTimeController,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Closing Time can\'t be empty';
                              }
                              return null;
                            },
                            hintText: 'Select Time',
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
              "Select Days",
              style: TextStyle(
                fontFamily: AppColors.helvetica,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 1.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.greytheme, width: 1.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: DropdownButton<String>(
                value: selectedDays,
                onChanged: (newValue) {
                  setState(() {
                    selectedDays = newValue!;
                  });
                },
                hint: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Text('Select Days'),
                ),
                isExpanded: true,
                underline: SizedBox(),
                dropdownColor:
                    Colors.white, // Set the background color to white
                items: daysOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
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
              buttonName: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
