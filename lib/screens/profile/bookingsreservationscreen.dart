import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';

class BookingsReservationScreen extends StatefulWidget {
  const BookingsReservationScreen({super.key});

  @override
  State<BookingsReservationScreen> createState() =>
      _BookingsReservationScreenState();
}

class _BookingsReservationScreenState extends State<BookingsReservationScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Booking & Reservations',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                  height: 35.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          authcontroller.favcategorieslist.length, (index) {
                        final favcategorydata =
                            authcontroller.favcategorieslist[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: customCatgegorySelectedContainer(
                            ontap: () {
                              authcontroller.favselectedcategory.value = index;
                            },
                            image: favcategorydata['image'],
                            title: favcategorydata['name'],
                            isSelected:
                                authcontroller.favselectedcategory.value ==
                                    index,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: authcontroller.favouriteslist.length,
                  itemBuilder: (context, index) {
                    final favdata = authcontroller.favouriteslist[index];
                    return customFavDetailContainer(
                        image: favdata['image'],
                        title: favdata['title'],
                        rating: favdata['rating'],
                        ratingcount: favdata['ratingcount'],
                        category: favdata['subtitle'],
                        distance: favdata['distance'],
                        type: favdata['type'],
                        screentype: 'true',
                        cancelremovetext: "Cancel",
                        cancelremoveontap: () {});
                  })
            ],
          ),
        ),
      ),
    );
  }
}
