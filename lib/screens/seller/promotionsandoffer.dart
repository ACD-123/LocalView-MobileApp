import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class PromotionsAndOffer extends StatefulWidget {
  const PromotionsAndOffer({super.key});

  @override
  State<PromotionsAndOffer> createState() => _PromotionsAndOfferState();
}

class _PromotionsAndOfferState extends State<PromotionsAndOffer> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;
  Widget customContainer(String imagePath, String title) {
    return Container(
      height: 55.h,
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
              height: 24.h, // You can adjust the height as per your design
              width: 24.w, // Similarly, adjust the width if needed
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.helvetica,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Promotions & Offers',
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.createoffer);
                },
                child: customContainer(
                    "assets/specialoffer.svg", "Create Special Offer"),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.promocode);
                  },
                  child: customContainer(
                      "assets/promotionicon.svg", "Promo Code")),
              SizedBox(height: 10.h),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteConstants.pushnotificaitonscreen);
                  },
                  child: customContainer(
                      "assets/notificationicon.svg", "Push Notification")),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteConstants.inappmessaging);
                },
                child: customContainer(
                    "assets/customericon.svg", "In-App Messaging"),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Recent Special Offers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppColors.joan,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 60.h,
                    width: 80.w,
                    child: Image.asset(
                      "assets/resimage.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '50% Discount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.lineargradient1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                      SizedBox(
                          height: 1
                              .h), // Optional space between title and description

                      Text(
                        "Get 50% OFF on every order every Friday.\nDon't miss out—treat yourself.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: FontFamily.helvetica,
                        ),
                        maxLines: 3, // Limit text to 3 lines
                        overflow: TextOverflow
                            .ellipsis, // Add "..." at the end if text overflows
                      ),
                      // SizedBox(height: 2.h), //
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 60.h,
                    width: 80.w,
                    child: Image.asset(
                      "assets/resimage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '50% Discount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.lineargradient1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                      SizedBox(
                          height: 1
                              .h), // Optional space between title and description

                      // Split text into two parts for "paragraph-wise" display
                      Text(
                        "Get 50% OFF on every order every Friday.\nDon't miss out—treat yourself.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: FontFamily.helvetica,
                        ),
                        maxLines: 3, // Limit text to 3 lines
                        overflow: TextOverflow
                            .ellipsis, // Add "..." at the end if text overflows
                      ),
                      // SizedBox(height: 2.h), //
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    height: 60.h,
                    width: 80.w,
                    child: Image.asset(
                      "assets/resimage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '50% Discount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.lineargradient1,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                      SizedBox(
                          height: 1
                              .h), // Optional space between title and description

                      // Split text into two parts for "paragraph-wise" display
                      Text(
                        "Get 50% OFF on every order every Friday.\nDon't miss out—treat yourself.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: FontFamily.helvetica,
                        ),
                        maxLines: 3, // Limit text to 3 lines
                        overflow: TextOverflow
                            .ellipsis, // Add "..." at the end if text overflows
                      ),
                      // SizedBox(height: 2.h), //
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
