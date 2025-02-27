import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customratingwidget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Favorites',
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
                      screentype: 'false',
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

/////////////
Padding customFavDetailContainer({
  required String image,
  required String title,
  required int rating,
  required String ratingcount,
  required String category,
  required String distance,
  required String screentype,
  VoidCallback? cancelremoveontap,
  String? cancelremovetext,
  String? type,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorD9D9),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: Image.network(
                  image,
                  height: 70.h,
                  width: 80.w,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              width: 6.w,
            ),
            SizedBox(
              width: 220.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: FontFamily.helvetica,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp),
                  ),
                  Row(
                    children: [
                      Text(
                        ratingcount,
                        style: TextStyle(
                            fontFamily: FontFamily.helvetica,
                            color: AppColors.black,
                            fontSize: 9.sp),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      customRatingWidget(rating: rating)
                      // customRatingBar(rating: rating)
                    ],
                  ),
                  screentype == 'showingresult'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 130.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category,
                                    style: TextStyle(
                                        fontFamily: FontFamily.helvetica,
                                        color: AppColors.color8F87,
                                        fontSize: 11.sp),
                                  ),
                                  Text(
                                    distance,
                                    style: TextStyle(
                                        fontFamily: FontFamily.helvetica,
                                        color: AppColors.color4DEC,
                                        fontSize: 11.sp),
                                  ),
                                ],
                              ),
                            ),
                            customButton(
                                height: 25.h,
                                fontsize: 8.sp,
                                width: 70.w,
                                ontap: cancelremoveontap ?? () {},
                                text: "Visit Website")
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                  fontFamily: FontFamily.helvetica,
                                  color: AppColors.color8F87,
                                  fontSize: 11.sp),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  distance,
                                  style: TextStyle(
                                      fontFamily: FontFamily.helvetica,
                                      color: type == 'distance'
                                          ? AppColors.maincolor
                                          : AppColors.color4DEC,
                                      fontSize: 11.sp),
                                ),
                                screentype == 'true'
                                    ? GestureDetector(
                                        onTap: cancelremoveontap,
                                        child: Text(
                                          cancelremovetext ?? "",
                                          style: TextStyle(
                                              fontFamily: FontFamily.helvetica,
                                              color: AppColors.colorEC25,
                                              fontSize: 11.sp),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
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

GestureDetector customCatgegorySelectedContainer(
    {required VoidCallback ontap,
    required String title,
    required bool isSelected,
    dynamic width,
    String? image}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: width,
      height: 32.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: isSelected ? AppColors.maincolor : AppColors.white,
          border: Border.all(color: AppColors.maincolor)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: image == null || image.isEmpty ? 25.w : 20.w,
            vertical: image == null || image.isEmpty ? 0 : 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null || image.isEmpty
                ? const SizedBox()
                : Image.asset(
                    image,
                    height: 20.h,
                    width: 20.w,
                    color: isSelected ? AppColors.white : AppColors.maincolor,
                    fit: BoxFit.fill,
                  ),
            image == null || image.isEmpty
                ? const SizedBox()
                : SizedBox(
                    width: 5.w,
                  ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: FontFamily.helvetica,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
