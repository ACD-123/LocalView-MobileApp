import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
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
          title: 'Transaction Detail',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius:
                    30, // Adjust the radius to change the size of the circle
                backgroundImage:
                    AssetImage('assets/profile2.png'), // Your profile image
                backgroundColor:
                    Colors.transparent, // Set transparent background if needed
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Text(
                'Austin Blake',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: Text(
                '\$203',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
            ),
            Center(
              child: Text(
                'Advance Booking',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lineargradient1,
                  fontSize: 16,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Divider(),
            SizedBox(
              height: 10.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Received:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greytheme,
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
                Text(
                  'Jan 04.2024',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'From:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greytheme,
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
                Text(
                  'Jade Nicolas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greytheme,
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
                Text(
                  '203.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment::',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.greytheme,
                    fontSize: 16,
                    fontFamily: FontFamily.helvetica,
                  ),
                ),
                Image.asset("assets/mastercard.png")
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
