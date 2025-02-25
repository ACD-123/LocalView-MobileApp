import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/emailtextfield.dart';
import 'package:localview/helpers/routeconstants.dart';

class AdvertisitngScreen extends StatefulWidget {
  const AdvertisitngScreen({super.key});

  @override
  State<AdvertisitngScreen> createState() => _AdvertisitngScreenState();
}

final BusinessController businessController = Get.put(BusinessController());
final TextEditingController startDateController = TextEditingController();
final TextEditingController endDateController = TextEditingController();

class _AdvertisitngScreenState extends State<AdvertisitngScreen> {
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
          title: 'Advertising Analytics',
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
                'Campaign Performance',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.joan,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Start Date Column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
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
                              "End Date",
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
                  Container(
                    height: 80.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xffF4F1F1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KPI",
                            style: TextStyle(
                              fontFamily: AppColors.helvetica,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Good",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: AppColors.helvetica,
                              fontSize: 20,
                              color: Color(0xff46D746),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Total Visitors and Revenue containers
                      Container(
                        height: 100.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF4F1F1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
//temporary code
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(RouteConstants.createproduct);
                                    },
                                    child: Text(
                                      "Spend",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppColors.helvetica,
                                      ),
                                    ),
                                  ),
                                  Image.asset("assets/arrowtop.png")
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "41,321",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppColors.helvetica,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff46D746),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 25,
                                    width: 40.w,
                                    child: Center(child: Text("+2%")),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                            color: Color(0xffF4F1F1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Conversion Rate",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppColors.helvetica,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/arrowbottom.svg",
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$43,321",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppColors.helvetica,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffE55353),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    height: 25,
                                    width: 40.w,
                                    child: Center(child: Text("-1.5%")),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF4F1F1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
//temporary code
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteConstants.createproduct);
                                },
                                child: Text(
                                  "Total Reservations",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppColors.helvetica,
                                  ),
                                ),
                              ),
                              Image.asset("assets/arrowtop.png")
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "240",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppColors.helvetica,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff46D746),
                                    borderRadius: BorderRadius.circular(12)),
                                height: 25,
                                width: 35.w,
                                child: Center(child: Text("+2%")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Campaign',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppColors.joan,
                                ),
                              ),
                              Text(
                                'Reach',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppColors.joan,
                                ),
                              ),
                              Text(
                                'Clicks',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppColors.joan,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Underline Container
                          Container(
                            height: 1, // Height of the underline
                            color: Colors.black, // Color of the underline
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Use Obx to get the data and display each item in the column
                          Obx(() {
                            // The campaign data is coming from businessController.campaignList
                            return Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Column(
                                children: businessController.campaignList
                                    .map((campaign) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0), // Reduce spacing
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              campaign['campaign']!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: AppColors.joan,
                                              ),
                                            ),
                                            Text(
                                              campaign['reach']!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              campaign['clicks']!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: AppColors.joan,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                            height:
                                                1, // Height of the underline
                                            color: Color(0xffE8E8E8)
                                            // Color of the underline
                                            ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
