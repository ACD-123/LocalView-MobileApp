import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/helpers/routeconstants.dart';

class PromoCodeScreen extends StatefulWidget {
  PromoCodeScreen({super.key});

  @override
  _PromoCodeScreenState createState() => _PromoCodeScreenState();
}

class _PromoCodeScreenState extends State<PromoCodeScreen> {
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

  final BusinessController businessController = Get.put(BusinessController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Promo Code',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
//temporary code
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteConstants.createproduct);
                              },
                              child: Text(
                                "Active Coupon",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.helvetica,
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
                              '253',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.helvetica,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Inactive Coupon",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: FontFamily.helvetica,
                              ),
                            ),
                            SvgPicture.asset(
                              "assets/arrowbottom.svg",
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "71",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: FontFamily.helvetica,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffE55353),
                                  borderRadius: BorderRadius.circular(12)),
                              height: 25,
                              width: 35.w,
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
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.all(8.0), // Adjust the padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sno',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.joan,
                          ),
                        ),
                        Text(
                          'Coupons',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.joan,
                          ),
                        ),
                        Text(
                          'Discount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.joan,
                          ),
                        ),
                        Text(
                          'Valid Till',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.joan,
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
                          children:
                              businessController.couponslist.map((couponslist) {
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
                                        couponslist['sno']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.joan,
                                        ),
                                      ),
                                      Text(
                                        couponslist['campaign']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.joan,
                                        ),
                                      ),
                                      Text(
                                        couponslist['reach']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        couponslist['clicks']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.joan,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Container(
                                      height: 1, // Height of the underline
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
                  Get.toNamed(RouteConstants.generatecodes);
                  // Handle login
                  // }
                },
                buttonName: "Add New Promo Code",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
