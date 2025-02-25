import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customline.dart';
import 'package:localview/customwidgets/customratingwidget.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:url_launcher/url_launcher.dart';

Widget homescreenbottomsheet({required ScrollController scrollController}) {
  final authenticationcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final componentcontroller = Get.put(ComponentController());
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.sp),
        topLeft: Radius.circular(20.sp),
      ),
      color: AppColors.white,
    ),
    child: SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: customLine()),
                  SizedBox(
                    height: 5.h,
                  ),
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
                    height: 5.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          authenticationcontroller
                              .restaurantdetailimageslist.length, (index) {
                        final resturantdata = authenticationcontroller
                            .restaurantdetailimageslist[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Image.asset(
                            resturantdata['image'],
                            height: 130.h,
                            width: 150.w,
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Row(
                      children: List.generate(
                          authenticationcontroller
                              .restaurantdetailtabslist.length, (index) {
                        final tabsdata = authenticationcontroller
                            .restaurantdetailtabslist[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 35.w),
                          child: GestureDetector(
                            onTap: () {
                              authenticationcontroller
                                  .updaterestaurantselectedtab(index);
                            },
                            child: Column(
                              children: [
                                Text(
                                  tabsdata,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: authenticationcontroller
                                                .restaurantselectedtab.value ==
                                            index
                                        ? FontWeight.w700
                                        : null,
                                    color: authenticationcontroller
                                                .restaurantselectedtab.value ==
                                            index
                                        ? AppColors.maincolor
                                        : AppColors.color8F90,
                                    fontFamily: authenticationcontroller
                                                .restaurantselectedtab.value ==
                                            index
                                        ? FontFamily.cairobold
                                        : FontFamily.cairo,
                                  ),
                                ),
                                authenticationcontroller
                                            .restaurantselectedtab.value ==
                                        index
                                    ? customLine(height: 3.5.h, width: 60.w)
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )),
            SizedBox(
              height: 15.h,
            ),
            Obx(() => authenticationcontroller.restaurantselectedtab.value == 0
                ? SizedBox(
                    height: 300.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 15.h),
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.end,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       SizedBox(
                          //         width: 125.w,
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Timing",
                          //               style: TextStyle(
                          //                 fontSize: 11.sp,
                          //                 color: AppColors.black,
                          //                 fontFamily: FontFamily.cairo,
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 5.h,
                          //             ),
                          //             customButton(
                          //                 ontap: () {},
                          //                 text: "Thu, Nov 7 - 8:00PM",
                          //                 bordercolor: AppColors.color2E2E
                          //                     .withOpacity(0.2),
                          //                 buttoncolor: AppColors.white,
                          //                 textcolor: AppColors.color8F90,
                          //                 fontsize: 9.sp,
                          //                 width: 125.w,
                          //                 height: 35.h)
                          //           ],
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 85.w,
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Persons",
                          //               style: TextStyle(
                          //                 fontSize: 11.sp,
                          //                 color: AppColors.black,
                          //                 fontFamily: FontFamily.cairo,
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 5.h,
                          //             ),
                          //             Container(
                          //               width: 85.w,
                          //               decoration: BoxDecoration(
                          //                   border: Border.all(
                          //                       color: AppColors.color2E2E
                          //                           .withOpacity(0.2)),
                          //                   color: AppColors.white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(30.sp)),
                          //               child: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 7.w, vertical: 7.h),
                          //                 child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   children: [
                          //                     Expanded(
                          //                       child: Text("04",
                          //                           style: TextStyle(
                          //                               fontSize: 12.sp,
                          //                               color:
                          //                                   AppColors.color8F90,
                          //                               fontFamily:
                          //                                   FontFamily.cairo)),
                          //                     ),
                          //                     SizedBox(
                          //                       width: 5.w,
                          //                     ),
                          //                     Icon(
                          //                       Icons.person,
                          //                       size: 15.sp,
                          //                       color: AppColors.maincolor,
                          //                     ),
                          //                     Icon(
                          //                       Icons.keyboard_arrow_down,
                          //                       size: 20.sp,
                          //                       color: AppColors.maincolor,
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       customButton(
                          //           ontap: () {
                          //             Get.toNamed(
                          //                 RouteConstants.reservationscreen);
                          //           },
                          //           text: "Reserve",
                          //           width: 110.w,
                          //           height: 35.h)
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15.h,
                          // ),
                          customDetailRow(
                              title:
                                  "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
                              icon: Icons.location_on),
                          customDetailRow(
                              title: "Open 24 hours",
                              icon: Icons.access_time_filled_sharp),
                          customDetailRow(
                              title: "restaurant@gmail.com", icon: Icons.email),
                          customDetailRow(
                              title: "123 456 789 0", icon: Icons.phone),
                          customDetailRow(
                              title: "www.restaurant.com",
                              icon: Icons.circle,
                              image: "assets/images/linkworldicon.png"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Social Links",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: AppColors.color8F90,
                                    fontFamily: FontFamily.cairo,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                customSocialLinkWidget(
                                    title: "Facebook",
                                    image: 'assets/images/facebookicon.png',
                                    link: "www.facebook.com"),
                                customSocialLinkWidget(
                                    title: "Instagram",
                                    image: 'assets/images/instagramicon.png',
                                    link: "www.instagram.com"),
                                customSocialLinkWidget(
                                    title: "Twitter",
                                    image: 'assets/images/twittericon.png',
                                    link: "www.twitter.com"),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        RouteConstants.sendfeedbackscreen);
                                  },
                                  child: Text(
                                    "Send Feedback",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.maincolor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.maincolor,
                                      fontFamily: FontFamily.cairobold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : authenticationcontroller.restaurantselectedtab.value == 1
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: SizedBox(
                          height: 300.h,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14.sp),
                                  child: Image.asset(
                                    "assets/images/restaurantdetailimage3.png",
                                    height: 120.h,
                                    width: Get.width,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  "Le Château de Luxe is a fictional, opulent estate nestled in the heart of the French countryside, offering an unparalleled blend of old-world charm and modern sophistication. Its sprawling grounds, dotted with lush gardens, serene fountains, and hidden alcoves, provide the perfect backdrop for those seeking privacy, luxury, and a taste of timeless elegance.",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.color8F87,
                                    fontFamily: FontFamily.helvetica,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : authenticationcontroller.restaurantselectedtab.value == 2
                        ? Center(
                            child: Text("Coming Soon",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: FontFamily.cairobold,
                                  color: AppColors.maincolor,
                                )),
                          )
                        : authenticationcontroller
                                    .restaurantselectedtab.value ==
                                3
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: SizedBox(
                                  height: 300.h,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: componentcontroller
                                          .discountlist.length,
                                      itemBuilder: (context, index) {
                                        final discountdata = componentcontroller
                                            .discountlist[index];
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 20.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                discountdata['image'],
                                                height: 85.h,
                                                width: 100.w,
                                                fit: BoxFit.fill,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                width: 220.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        discountdata[
                                                            'discount'],
                                                        style: TextStyle(
                                                          fontSize: 20.sp,
                                                          fontFamily: FontFamily
                                                              .cairobold,
                                                          color: AppColors
                                                              .maincolor,
                                                        )),
                                                    Text(
                                                        discountdata[
                                                            'description'],
                                                        style: TextStyle(
                                                          fontSize: 11.sp,
                                                          fontFamily:
                                                              FontFamily.cairo,
                                                          color: AppColors
                                                              .color8F90,
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ))
                            : authenticationcontroller
                                        .restaurantselectedtab.value ==
                                    4
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: SizedBox(
                                      height: 300.h,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: componentcontroller
                                              .reviewslist.length,
                                          itemBuilder: (context, index) {
                                            final reviewdata =
                                                componentcontroller
                                                    .reviewslist[index];
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 20.h),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 8,
                                                            color: AppColors
                                                                .color2E2E
                                                                .withOpacity(
                                                                    0.1),
                                                            offset:
                                                                const Offset(
                                                                    2, 2))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5.h,
                                                              vertical: 5.w),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 25.sp,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                  reviewdata[
                                                                      'image'],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.w,
                                                              ),
                                                              Text(
                                                                reviewdata[
                                                                    'name'],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .helvetica,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5.h,
                                                          ),
                                                          Divider(
                                                            color: AppColors
                                                                .color2E2E
                                                                .withOpacity(
                                                                    0.1),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.sp),
                                                              // border: Border.all(
                                                              //     color: AppColors.color2E2E
                                                              //         .withOpacity(0.1))
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10.w,
                                                                      vertical:
                                                                          5.h),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    reviewdata[
                                                                        'comment'],
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12.sp,
                                                                      color: AppColors
                                                                          .black,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .helvetica,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5.h,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      customRatingWidget(
                                                                        size: 30
                                                                            .sp,
                                                                        rating:
                                                                            reviewdata['rating'],
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ))
                                : const SizedBox()),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    ),
  );
}

///////////////custom detail row
Column customDetailRow(
    {required String title, required IconData icon, String? image}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
          children: [
            image == null || image.isEmpty
                ? Icon(
                    icon,
                    size: 20.sp,
                    color: AppColors.maincolor,
                  )
                : Image.asset(
                    image,
                    height: 20.h,
                    width: 20.w,
                    fit: BoxFit.fill,
                  ),
            SizedBox(
              width: 7.w,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.color8F87,
                  fontFamily: FontFamily.helvetica,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Divider(
        color: AppColors.black.withOpacity(0.1),
      ),
      SizedBox(
        height: 10.h,
      ),
    ],
  );
}

////////////////
Padding customSocialLinkWidget({
  required String title,
  required String image,
  required String link,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          image,
          height: 30.h,
          width: 30.w,
          fit: BoxFit.fill,
        ),
        Container(
          width: 290.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(color: AppColors.color2E2E.withOpacity(0.2))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.color9494,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                      Text(
                        link,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.black,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final url = link;
                    if (url != null && await canLaunchUrl(Uri.parse(url))) {
                      await launchUrl(Uri.parse(url),
                          mode: LaunchMode.externalApplication);
                    } else {}
                  },
                  child: Text(
                    "Copy",
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.color022D,
                      fontFamily: FontFamily.helvetica,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
