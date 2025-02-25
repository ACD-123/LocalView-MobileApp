import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customratingwidget.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 230.h,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/reservationimage.png',
                      ),
                      fit: BoxFit.fill),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            size: 25.sp,
                            color: AppColors.white,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.h),
                        child: Center(
                          child: Text(
                            'Reservations',
                            style: TextStyle(
                                fontSize: 24.sp,
                                color: AppColors.white,
                                fontFamily: FontFamily.helvetica,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Le Château de Luxe",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.maincolor,
                              fontFamily: FontFamily.helvetica,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/images/sendicon.png",
                          height: 16.h,
                          width: 16.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.save,
                          size: 18.sp,
                          color: AppColors.maincolor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.cancel,
                            size: 18.sp,
                            color: AppColors.colorA7A3,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "3.8",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.black,
                            fontFamily: FontFamily.helvetica,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        customRatingWidget(rating: 4),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "(145)",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.color8989,
                            fontFamily: FontFamily.helvetica,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Restaurant - Distance (9 mint)",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.color8F87,
                        fontFamily: FontFamily.helvetica,
                      ),
                    ),
                    Text(
                      "Open 24 hours",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.color4DEC,
                        fontFamily: FontFamily.helvetica,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: customTextFormField(
                              fieldtitle: "Timing",
                              hinttext: "Thu, Nov 7 - 8:00PM"),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: customTextFormField(
                              fieldtitle: "Persons", hinttext: "02"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: customTextFormField(
                              fieldtitle: "First Name", hinttext: "Jade"),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: customTextFormField(
                              fieldtitle: "Last Name", hinttext: "Nicolas"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    customTextFormField(
                        hinttext: "nicolas@gmail.com", fieldtitle: "Email"),
                    SizedBox(
                      height: 10.h,
                    ),
                    customTextFormField(
                        hinttext: "123 456 789 0", fieldtitle: "Phone"),
                    SizedBox(
                      height: 10.h,
                    ),
                    customTextFormField(
                      lines: 3,
                      hinttext:
                          "Hi! I’d like to make a reservation for dinner tonight. Do you have any tables available for two people around 7 p.m.?",
                      fieldtitle: "Message",
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    customButton(ontap: () {}, text: "Submit"),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
