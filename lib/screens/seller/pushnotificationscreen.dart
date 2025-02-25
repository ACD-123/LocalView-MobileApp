import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
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
          title: 'Push Notification',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Label",
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
              hintText: 'Winter Sale 🏷️',
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Product Description",
              style: TextStyle(
                fontFamily: FontFamily.helvetica,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type your message here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                labelText: 'Enjoy up to 50% off on selected items! 🛍️ ',

                labelStyle: TextStyle(
                  color: Colors.grey,
                  // color: AppColors.lineargradient1, // Set the label color
                  fontSize: 16,
                  fontFamily: FontFamily.joan,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25), // Rounded corners
                  borderSide: BorderSide(
                    // color: Colors.black,
                    color: AppColors.lineargradient1, // Border color
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color:
                        AppColors.lineargradient1, // Border color when focused
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(
                    color: AppColors.greytheme,
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0), // Adjust height
              ),
              maxLines: 6, // Increased max lines for a taller message box
              minLines: 3, // Minimum height when empty (this can be adjusted)
              keyboardType: TextInputType.multiline,
              onChanged: (text) {
                // Handle text input here
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Upload Picture (Optional)",
              style: TextStyle(
                fontFamily: FontFamily.helvetica,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.grey)),
              height: 150.h,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/covericon.png", height: 40),
                ],
              ),
            ),
            //  SizedBox(
            //   height: 15.h,
            // ),
            // Text(
            //   "Max Discount",
            //   style: TextStyle(
            //     fontFamily: FontFamily.helvetica,
            //   ),
            // ),
            // SizedBox(
            //   height: 8.h,
            // ),
            // CustomTextField(
            //   enabled: true,
            //   editingController: TextEditingController(),
            //   validator: (v) {
            //     // if (v!.isEmpty) {
            //     //   return 'Email can\'t be empty';
            //     // } else if (!v.isEmail) {
            //     //   return 'Invalid Email';
            //     // }
            //     return null;
            //   },
            //   hintText: '100\$',
            // ),
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
    );
  }
}
