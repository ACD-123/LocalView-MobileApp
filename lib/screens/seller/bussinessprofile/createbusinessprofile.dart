import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';

class Selectyourbusiness extends StatefulWidget {
  @override
  State<Selectyourbusiness> createState() => _SelectyourbusinessState();
}

class _SelectyourbusinessState extends State<Selectyourbusiness> {
  // Initialize controllers
  final BusinessController businessController = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          // Wrapping the content in SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.all(15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Center(
                  child: Text(
                    'Select Your Business',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: AppColors.joan,
                        color: AppColors.textcolor),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                // SizedBox(height: 4.h), // Add some spacing before the GridView
                Obx(
                  () {
                    // List of businesses
                    return GridView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Prevent internal scrolling of GridView
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 13.h,
                        mainAxisSpacing: 12.h,
                      ),
                      itemCount: businessController.businessList.length,
                      itemBuilder: (context, index) {
                        var business = businessController.businessList[index];
                        return GestureDetector(
                          onTap: () {
                            // Handle business selection
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.textcolor,
                                )),
                            height: 130,
                            width: 170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(business["image"], height: 80),
                                SizedBox(height: 1.h),
                                Text(
                                  business["title"],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppColors.helvetica,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
