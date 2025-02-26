import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/controller/userprofilecontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  final userprofilecontroller =
      Get.put(UserProfileController(userProfileRepo: Get.find()));
  final componentcontroller = Get.put(ComponentController());
  ScrollController scrollcontroller = ScrollController();

/////addresses pagination
  addressesPagination() {
    if (scrollcontroller.offset >= scrollcontroller.position.maxScrollExtent &&
        !scrollcontroller.position.outOfRange) {
      userprofilecontroller.getAllUserAddresses();
    }
  }

  @override
  void initState() {
    super.initState();
    userprofilecontroller.getalluseraddressesPage.value = 1;
    userprofilecontroller.getAllUserAddresses();
    scrollcontroller.addListener(addressesPagination);
    userprofilecontroller.getPlaceId("Apex tech world");
  }

  @override
  void dispose() {
    super.dispose();
    scrollcontroller.dispose();
  }

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
            controller: scrollcontroller,
            child: Obx(
              () => userprofilecontroller.getalluseraddressesLoading.value
                  ? Column(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: customDummyLoader(),
                              )),
                    )
                  : userprofilecontroller.getalluseraddresses.value == null ||
                          userprofilecontroller
                                  .getalluseraddresses.value?.data ==
                              null
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 240.h),
                          child: Center(
                            child: customNotDataText(
                                text: "Addresses not available"),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Default Address",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: FontFamily.helvetica,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            userprofilecontroller.getalluseraddresses.value
                                        ?.data?.dataDefault ==
                                    null
                                ? Center(
                                    child: customNotDataText(
                                        text: "Default Address  available"),
                                  )
                                : addressContainer(
                                    selected: true,
                                    ontap: () {},
                                    label: toCamelCase(userprofilecontroller
                                            .getalluseraddresses
                                            .value
                                            ?.data
                                            ?.dataDefault
                                            ?.label
                                            .toString() ??
                                        ""),
                                    address: userprofilecontroller
                                            .getalluseraddresses
                                            .value
                                            ?.data
                                            ?.dataDefault
                                            ?.address
                                            .toString() ??
                                        "",
                                    city: userprofilecontroller
                                            .getalluseraddresses
                                            .value
                                            ?.data
                                            ?.dataDefault
                                            ?.city
                                            .toString() ??
                                        "",
                                    country: userprofilecontroller
                                            .getalluseraddresses
                                            .value
                                            ?.data
                                            ?.dataDefault
                                            ?.country
                                            .toString() ??
                                        "",
                                    zipcode: userprofilecontroller
                                            .getalluseraddresses
                                            .value
                                            ?.data
                                            ?.dataDefault
                                            ?.zip
                                            .toString() ??
                                        "",
                                  ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "Saved Addresses",
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontFamily: FontFamily.helvetica,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            userprofilecontroller
                                            .getalluseraddresses.value?.data?.userAddress ==
                                        null ||
                                    userprofilecontroller.getalluseraddresses
                                        .value!.data!.userAddress!.isEmpty
                                ? Center(
                                    child: customNotDataText(
                                        text: "Addresses not available"),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: userprofilecontroller
                                        .getalluseraddresses
                                        .value
                                        ?.data
                                        ?.userAddress
                                        ?.length,
                                    itemBuilder: (context, index) {
                                      final addressesdata =
                                          userprofilecontroller
                                              .getalluseraddresses
                                              .value
                                              ?.data
                                              ?.userAddress?[index];
                                      return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 15.h),
                                          child: Obx(() => addressContainer(
                                                ontap: () {
                                                  componentcontroller
                                                      .selectedaddress
                                                      .value = index;
                                                },
                                                selected: componentcontroller
                                                        .selectedaddress
                                                        .value ==
                                                    index,
                                                label: toCamelCase(addressesdata
                                                        ?.label
                                                        .toString() ??
                                                    ""),
                                                address: addressesdata?.address
                                                        .toString() ??
                                                    "",
                                                city: addressesdata?.city
                                                        .toString() ??
                                                    "",
                                                country: addressesdata?.country
                                                        .toString() ??
                                                    "",
                                                zipcode: addressesdata?.zip
                                                        .toString() ??
                                                    "",
                                              )));
                                    }),
                            userprofilecontroller
                                    .getalluseraddressesReloading.value
                                ? Center(
                                    child: customCircularProgress(),
                                  )
                                : const SizedBox()
                          ],
                        ),
            )),
      ),
    );
  }
}

///////////address container
GestureDetector addressContainer({
  required bool selected,
  required VoidCallback ontap,
  required String label,
  required String address,
  required String city,
  required String country,
  required String zipcode,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(
              color: selected
                  ? AppColors.maincolor
                  : AppColors.maincolor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(24.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label,
                          style: TextStyle(
                              fontWeight: selected
                                  ? FontWeight.w900
                                  : FontWeight.normal,
                              fontSize: 15.sp,
                              fontFamily: FontFamily.helvetica,
                              color: selected
                                  ? AppColors.maincolor
                                  : AppColors.black)),
                      Text(address,
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: FontFamily.helvetica,
                              color: AppColors.color9494))
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
                Text(zipcode,
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: FontFamily.helvetica,
                        color: AppColors.color8484)),
                const Spacer(),
                SizedBox(
                  width: 200.w,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text("$city, $country",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: FontFamily.helvetica,
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
  );
}
