import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class AddNewBlogScreen extends StatefulWidget {
  const AddNewBlogScreen({super.key});

  @override
  State<AddNewBlogScreen> createState() => _AddNewBlogScreenState();
}

final BusinessController businessController = Get.put(BusinessController());
final TextEditingController startDateController = TextEditingController();
final TextEditingController endDateController = TextEditingController();

class _AddNewBlogScreenState extends State<AddNewBlogScreen> {
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
          title: "Add New Blog",
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cover Photo",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 130.h,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/covericon.png", height: 40),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Heading',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                editingController: TextEditingController(),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Name can\'t be empty';
                  }
                  return null;
                },
                hintText: 'New VR Headsets That Will Shape the Metaverse',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Category',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                editingController: TextEditingController(),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Name can\'t be empty';
                  }
                  return null;
                },
                hintText: 'Restuarant',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Published Date',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextField(
                editingController: TextEditingController(),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Name can\'t be empty';
                  }
                  return null;
                },
                hintText: 'Restuarant',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Content",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Type your message here',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  // labelText: 'Description',

                  labelStyle: TextStyle(
                    color: AppColors.lineargradient1, // Set the label color
                    fontSize: 16,
                    fontFamily: AppColors.joan,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    borderSide: BorderSide(
                      color: AppColors.lineargradient1, // Border color
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors
                          .lineargradient1, // Border color when focused
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey
                          .withOpacity(0.5), // Border color when enabled
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
              ElevetedButton(
                gradientColors: [
                  AppColors.lineargradient1,
                  AppColors.lineargradient2
                ],
                textColor: Colors.white,
                ontap: () {
                  Get.back();
                },
                buttonName: 'Publish',
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
