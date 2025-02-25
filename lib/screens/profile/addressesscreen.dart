import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.maincolor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(RouteConstants.addressesmapscreen);
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: AppColors.white,
        ),
      ),
      appBar: customAppBar(
          title: 'Addresses',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: componentcontroller.addresseslist.length,
                  itemBuilder: (context, index) {
                    final addressesdata =
                        componentcontroller.addresseslist[index];
                    return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              componentcontroller.selectedaddress.value = index;
                            },
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: componentcontroller
                                                  .selectedaddress.value ==
                                              index
                                          ? AppColors.maincolor
                                          : AppColors.maincolor
                                              .withOpacity(0.1)),
                                  borderRadius: BorderRadius.circular(24.sp)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/homeicon.png",
                                          height: 45.h,
                                          width: 45.w,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          width: 230.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(addressesdata['type'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          componentcontroller
                                                                      .selectedaddress
                                                                      .value ==
                                                                  index
                                                              ? FontWeight.w900
                                                              : FontWeight
                                                                  .normal,
                                                      fontSize: 15.sp,
                                                      fontFamily:
                                                          FontFamily.helvetica,
                                                      color: componentcontroller
                                                                  .selectedaddress
                                                                  .value ==
                                                              index
                                                          ? AppColors.maincolor
                                                          : AppColors.black)),
                                              Text(addressesdata['address'],
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontFamily:
                                                          FontFamily.helvetica,
                                                      color:
                                                          AppColors.color9494))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(addressesdata['zipcode'],
                                            style: TextStyle(
                                                fontSize: 11.sp,
                                                fontFamily:
                                                    FontFamily.helvetica,
                                                color: AppColors.color8484)),
                                        const Spacer(),
                                        SizedBox(
                                          width: 200.w,
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                                "${addressesdata['city']}, ${addressesdata['country']}",
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontFamily:
                                                        FontFamily.helvetica,
                                                    color: AppColors.black)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  })
            ],
          ),
        )),
      ),
    );
  }
}
