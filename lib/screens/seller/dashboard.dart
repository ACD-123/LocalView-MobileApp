import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customswitchbutton.dart';
import 'package:localview/helpers/routeconstants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final componentcontroller = Get.put(ComponentController());
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  // Function to create a reusable container widget
  Widget customContainer(String imagePath, String title) {
    return Container(
      height: 50.h,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(width: 3.w),
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.fill,
              height: 16.h, // You can adjust the height as per your design
              width: 18.h, // Similarly, adjust the width if needed
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppColors.helvetica,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.lineargradient1,
              onPrimary: Colors.white,
              minimumSize: Size(Get.width, 50), // Set the height of the button
            ),
            onPressed: () {
              authcontroller.logout();
            },
            child: Text('Logout'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/profileimage.png"),
                    Column(
                      children: [
                        Text(
                          "Hi Anderson",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.lineargradient1,
                              fontFamily: AppColors.helvetica,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Your ID: #12QAB6",
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteConstants.notificationscreen);
                        },
                        child: Image.asset("assets/notificationicon.png")),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: AppColors.helvetica,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Become a user",
                      style: TextStyle(
                          fontFamily: FontFamily.helvetica,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: AppColors.black),
                    ),
                    Transform.scale(
                      scale: 0.7.sp,
                      child: customSwitchButton(
                          value: componentcontroller.becomeasellerswitch,
                          onChanged: (value) {
                            componentcontroller
                                .updateBecomeASellerSwitch(value);
                            Get.offAllNamed(RouteConstants.homescreen);
                          }),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text(
                      "\$120,432.05",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppColors.helvetica,
                      ),
                    ),
                    SizedBox(width: 10.w),
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
                SizedBox(height: 3.h),
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
                                Text(
                                  "Total\nVisitors",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppColors.helvetica,
                                  ),
                                ),
                                Image.asset("assets/arrowtop.png")
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "Total\nRevenue",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppColors.helvetica,
                                  ),
                                ),
                                SvgPicture.asset("assets/arrowbottom.svg")
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(height: 15.h),
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppColors.helvetica,
                  ),
                ),
                SizedBox(height: 15.h),

                // Custom containers with different titles and images
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.businessmanagment);
                  },
                  child: customContainer(
                    "assets/bussinesimage.svg",
                    "Business Management",
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.anyliticsscreen);
                  },
                  child: customContainer("assets/serviceicon.svg",
                      "Service or Product Management"),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.promotionsandoffer);
                  },
                  child: customContainer(
                      "assets/promotionicon.svg", "Promotions & Advertising"),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteConstants.reviewscreen);
                    },
                    child: customContainer(
                        "assets/reviewicon.svg", "Review Management")),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.customerinteraction);
                  },
                  child: customContainer("assets/customericon.svg",
                      "Customer Interaction & Messaging"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.sellerblogsnewscreen);
                  },
                  child:
                      customContainer("assets/blogsicon.svg", "Blog and News"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.anyliticsscreen);
                  },
                  child: customContainer("assets/analyticsinsightsimage.svg",
                      "Analytics & Insights"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.paymentmethod);
                  },
                  child: customContainer(
                      "assets/paymenticon.svg", "Payment Management & Billing"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.subscriptionscreen);
                  },
                  child: customContainer("assets/subscriptionmanagimage.svg",
                      "Subscription and Plan Management"),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.sellersettingscreen);
                  },
                  child: customContainer("assets/setting.svg", "Setting"),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
