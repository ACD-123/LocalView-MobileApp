import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/customwidgets/emailtextfield.dart';
import 'package:localview/helpers/routeconstants.dart';

class CreateSepecialOfferScreen extends StatefulWidget {
  CreateSepecialOfferScreen({super.key});

  @override
  _CreateSepecialOfferScreenState createState() =>
      _CreateSepecialOfferScreenState();
}

class _CreateSepecialOfferScreenState extends State<CreateSepecialOfferScreen> {
  // Dropdown value and categories
  String? selectedCategory;
  final List<String> categories = [
    'Margherita Pizza',
    'Grilled Chicken Sandwich',
    'Caesar Salad',
    'Spaghetti Carbonara',
    'Beef Burger with Fries',
    'Fish Tacos',
    'Vegetarian Sushi Roll',
    'Margarita Cocktail',
  ];

// select percentage list
  String? selectpercentage;
  final List<String> percentagelist = [
    '10%',
    '30%',
    '40%',
    '90%',
    '3%',
    '60%',
  ];
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
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                AppColors.lineargradient1, // Customize the primary color

            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor:
                Colors.white, // Customizing the date picker background to white
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary:
                    AppColors.lineargradient1, // Customize button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
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
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                AppColors.lineargradient1, // Customize the primary color

            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor:
                Colors.white, // Customizing the date picker background to white
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary:
                    AppColors.lineargradient1, // Customize button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      endDateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Create Special Offer',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.lineargradient1,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30), // Circular border
                  color: Colors.white, // White background for the container
                ),
                height: 45.h, // Set a fixed height to match your design
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    isExpanded: true, // Ensures the dropdown takes full width
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
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
                    hint: Padding(
                      padding: const EdgeInsets.only(left: 4.0, top: 6.0),
                      child: Text(
                        'Select Product',
                        style: TextStyle(
                          color: AppColors.lineargradient1,
                          fontSize: 15,
                          fontFamily: AppColors.helvetica,
                        ),
                      ),
                    ),
                    dropdownColor:
                        Colors.white, // Make the dropdown background white
                    iconEnabledColor: Colors.black, // Dropdown icon color
                    underline: Container(), // Remove the underline
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Special Offer Image',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 170.h,
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
                'Discount Type',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.helvetica,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.lineargradient1,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30), // Circular border
                  color: Colors.white, // White background for the container
                ),
                height: 45.h, // Set a fixed height to match your design
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    value: selectpercentage,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectpercentage = newValue;
                      });
                    },
                    isExpanded: true, // Ensures the dropdown takes full width
                    items: percentagelist
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: AppColors.helvetica,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      'Select Percent',
                      style: TextStyle(
                        color: AppColors.lineargradient1,
                        fontSize: 15,
                        fontFamily: AppColors.helvetica,
                      ),
                    ),
                    dropdownColor:
                        Colors.white, // Make the dropdown background white
                    iconEnabledColor:
                        AppColors.lineargradient1, // Dropdown icon color
                    underline: Container(), // Remove the underline
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
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
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
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
                height: 20.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevetedButton(
                  color: AppColors.lineargradient1,
                  ontap: () {
                    // if (_loginFormKey.currentState!.validate()) {
                    Get.toNamed(RouteConstants.promocode);
                    // Handle login
                    // }
                  },
                  buttonName: "Start Promotion",
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
