import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/emailtextfield.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
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
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor:
                    Colors.black, // Optional: Set the primary color if needed
                // accentColor:
                // Colors.black, // Optional: Set the accent color if needed
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
                dialogBackgroundColor:
                    Colors.white, // Set the background color to white
              ),
              child: child!,
            );
          },
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
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor:
                    Colors.black, // Optional: Set the primary color if needed
                // accentColor: Colors.black,  // Optional: Set the accent color if needed
                buttonTheme:
                    ButtonThemeData(textTheme: ButtonTextTheme.primary),
                dialogBackgroundColor:
                    Colors.white, // Set the background color to white
              ),
              child: child!,
            );
          },
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
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
                    'Business Information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppColors.joan,
                        color: AppColors.textcolor),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Text(
                    "Fill the information below.",
                    style: TextStyle(
                      fontFamily: AppColors.helvetica,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Business Name",
                  style: TextStyle(
                    fontFamily: AppColors.helvetica,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Make heading bold
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
                SizedBox(height: 15.h),
                Text(
                  "Business Email Address",
                  style: TextStyle(
                    fontFamily: AppColors.helvetica,
                    fontWeight: FontWeight.bold, // Make heading bold
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
                    fontWeight: FontWeight.bold, // Make heading bold
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
                  hintText: 'Enter Your Phone Number',
                ),
                SizedBox(
                  height: 15.h,
                ),
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
                              fontWeight: FontWeight.bold, // Make heading bold
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
                              fontWeight: FontWeight.bold, // Make heading bold
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
                    fontWeight: FontWeight.bold, // Make heading bold
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.h, vertical: 1.h),
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
                      padding: const EdgeInsets.all(8.0),
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
                SizedBox(height: 15.h),
                Text(
                  "Business Info",
                  style: TextStyle(
                    fontFamily: AppColors.helvetica,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Make heading bold
                  ),
                ),
                SizedBox(height: 1.h),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
