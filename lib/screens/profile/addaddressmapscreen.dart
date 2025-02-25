import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customtextformfield.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/setupprofile/addaddressscreen.dart';

class AddAddressMapScreen extends StatefulWidget {
  const AddAddressMapScreen({super.key});

  @override
  State<AddAddressMapScreen> createState() => _AddAddressMapScreenState();
}

class _AddAddressMapScreenState extends State<AddAddressMapScreen> {
  late GoogleMapController mapController;
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final LatLng _initialPosition = const LatLng(30.34180, -97.75458);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: "Add Address",
          ontap: () {
            Get.back();
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                              isSelected: authcontroller.addAddresstype.value ==
                                  "home"),
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
                              isSelected: authcontroller.addAddresstype.value ==
                                  "other"),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
