import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/helpers/routeconstants.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected subscription box
  String selectedSubscription = 'Basic'; // Default to Basic

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back)),
                  Expanded(
                    child: Text(
                      'Buy Subscription',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppColors.joan,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubscription = 'Basic'; // Select Basic
                      });
                    },
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: selectedSubscription == 'Basic'
                                ? Colors.transparent
                                : Colors.black), // Selected box has no border
                        color: selectedSubscription == 'Basic'
                            ? AppColors.lineargradient1
                            : Colors.transparent, // Selected box has color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Basic',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppColors.helvetica,
                            color: selectedSubscription == 'Basic'
                                ? Colors.white
                                : Colors
                                    .black, // Text color changes when selected
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubscription = 'Gold'; // Select Gold
                      });
                    },
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: selectedSubscription == 'Gold'
                                ? Colors.transparent
                                : Colors.black), // Selected box has no border
                        color: selectedSubscription == 'Gold'
                            ? AppColors.lineargradient1
                            : Colors.transparent, // Selected box has color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Gold',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppColors.helvetica,
                            color: selectedSubscription == 'Gold'
                                ? Colors.white
                                : Colors
                                    .black, // Text color changes when selected
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubscription = 'Premium'; // Select Premium
                      });
                    },
                    child: Container(
                      width: 80.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: selectedSubscription == 'Premium'
                                ? Colors.transparent
                                : Colors.black), // Selected box has no border
                        color: selectedSubscription == 'Premium'
                            ? AppColors.lineargradient1
                            : Colors.transparent, // Selected box has color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Premium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppColors.helvetica,
                            color: selectedSubscription == 'Premium'
                                ? Colors.white
                                : Colors
                                    .black, // Text color changes when selected
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                height: 450.h,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff1B61C3))),
                child: Column(children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'LocalView Plan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppColors.helvetica,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    '\$4.99 /month',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppColors.helvetica,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.done),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Prioritized listing in local searches.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.done),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Prioritized listing in local searches.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.done),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Highlight promotions and offers.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.done),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          'Advanced insights (search terms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
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
                  Get.toNamed(RouteConstants.dashboardscreen);
                },
                buttonName: 'Save 20% with yearly plan (\$120/year)',
                fontSize: 15,
              ),
              SizedBox(
                height: 10.h,
              ),
              ElevetedButton(
                borderColor: Colors.grey,
                color: Colors.white,
                textColor: Colors.black,
                ontap: () {},
                buttonName: 'Buy Monthly',
                fontSize: 15,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
