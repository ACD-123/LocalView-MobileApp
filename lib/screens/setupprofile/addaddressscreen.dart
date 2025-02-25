import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customtextformfield.dart';
import 'package:localview/helpers/routeconstants.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late GoogleMapController mapController;
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final LatLng _initialPosition = const LatLng(30.34180, -97.75458);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Add Address",
              style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: FontFamily.joan,
                  color: AppColors.maincolor),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
            child: Text(
              "Enter your current Address.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.helvetica,
                  color: AppColors.color9494),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: SizedBox(
              height: 300.h,
              width: Get.width,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 12.0,
                ),
                onMapCreated: _onMapCreated,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                customTextFormField(
                    fieldtitle: "Address",
                    hinttext: "Enter Your Current Address"),
                SizedBox(
                  height: 15.h,
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addresstypecontainer(
                            ontap: () {
                              authcontroller.updateAddAddressType("home");
                              Get.toNamed(
                                  RouteConstants.addaddressfieldsScreen);
                            },
                            title: "Home",
                            isSelected:
                                authcontroller.addAddresstype.value == "home"),
                        addresstypecontainer(
                            ontap: () {
                              authcontroller.updateAddAddressType("office");
                              Get.toNamed(
                                  RouteConstants.addaddressfieldsScreen);
                            },
                            title: "Office",
                            isSelected: authcontroller.addAddresstype.value ==
                                "office"),
                        addresstypecontainer(
                            ontap: () {
                              authcontroller.updateAddAddressType("other");
                              Get.toNamed(
                                  RouteConstants.addaddressfieldsScreen);
                            },
                            title: "Other",
                            isSelected:
                                authcontroller.addAddresstype.value == "other"),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

///////////add addrees type container
GestureDetector addresstypecontainer(
    {required String title,
    required bool isSelected,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: 90.w,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.maincolor : AppColors.colorFDFD,
          border: isSelected ? null : Border.all(color: AppColors.colorDBDB),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 13.sp,
                fontFamily: FontFamily.helvetica,
                color: isSelected ? AppColors.white : AppColors.color6565),
          ),
        ),
      ),
    ),
  );
}
