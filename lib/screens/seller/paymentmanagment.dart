import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class PaymentMangmentScreen extends StatefulWidget {
  const PaymentMangmentScreen({super.key});

  @override
  State<PaymentMangmentScreen> createState() => _PaymentMangmentScreenState();
}

class _PaymentMangmentScreenState extends State<PaymentMangmentScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  // Function to show Date Picker for Start Date

  // Function to create a reusable container widget
  Widget customerplan(String text, String title) {
    return Container(
      height: 55.h,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Text(
            "\$$text",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lineargradient1,
              fontFamily: FontFamily.helvetica,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.helvetica,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Payment Management',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
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
                                  "Total Income",
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
                                "\$41,321",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Spending",
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
                                "\$43,321",
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
              Text(
                "Subscription Management",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                height: 55.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    SvgPicture.asset(
                      "assets/subscription.svg",
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "View Subscription Renewals",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontFamily.helvetica,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Plans",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              customerplan("100", "\$100 Per Month"),
              SizedBox(
                height: 8.h,
              ),
              customerplan("200", "\$200 Per Month"),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Current Plans",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              customerplan("100", "\$100 Per Month"),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today Transaction",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.helvetica,
                    ),
                  ),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: Image.asset("assets/arrowtop.png"),
                  )
                ],
              ),
              Text(
                "13 transaction today",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(() {
                return SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: businessController.transactionlist.length,
                    itemBuilder: (context, index) {
                      var coupon = businessController.transactionlist[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteConstants.transactiondetails);
                        },
                        child: Card(
                          child: SizedBox(
                            height: 70.h,
                            width: Get.width,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(coupon["profileImage"] ??
                                        "assets/profile2.png"), // Profile Image
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        coupon["campaign"] ??
                                            "Unknown Campaign", // Campaign name
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontFamily:
                                              'Helvetica', // Adjust as per your app font
                                        ),
                                      ),
                                      Text(
                                        "${coupon["reach"]} Reach", // Reach
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontFamily: 'Helvetica',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    coupon["date"] ?? "N/A", // Date
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  Text(
                                    coupon["amount"] ?? "\$0", // Amount
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
