import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customtextformfield.dart';
import 'package:localview/screens/setupprofile/addaddressscreen.dart';

class AddAddressFieldsScreen extends StatefulWidget {
  const AddAddressFieldsScreen({super.key});

  @override
  State<AddAddressFieldsScreen> createState() => _AddAddressFieldsScreenState();
}

class _AddAddressFieldsScreenState extends State<AddAddressFieldsScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
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
                SizedBox(
                  height: 30.h,
                ),
                customTextFormField(
                    fieldtitle: "Address",
                    hinttext: "Enter Your Current Address"),
                SizedBox(
                  height: 10.h,
                ),
                customTextFormField(
                    fieldtitle: "Country", hinttext: "United State of America"),
                SizedBox(
                  height: 10.h,
                ),
                customTextFormField(fieldtitle: "City", hinttext: "New York"),
                SizedBox(
                  height: 10.h,
                ),
                customTextFormField(fieldtitle: "Zip Code", hinttext: "75500"),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addresstypecontainer(
                            ontap: () {},
                            title: "Home",
                            isSelected:
                                authcontroller.addAddresstype.value == "home"),
                        addresstypecontainer(
                            ontap: () {},
                            title: "Office",
                            isSelected: authcontroller.addAddresstype.value ==
                                "office"),
                        addresstypecontainer(
                            ontap: () {},
                            title: "Other",
                            isSelected:
                                authcontroller.addAddresstype.value == "other"),
                      ],
                    )),
                SizedBox(
                  height: 30.h,
                ),
                customButton(
                    ontap: () {
                      Get.back();
                    },
                    text: "Confirm"),
                SizedBox(
                  height: 10.h,
                ),
                customButton(
                    ontap: () {
                      Get.back();
                    },
                    text: "Cancel",
                    bordercolor: AppColors.color2E2E.withOpacity(0.2),
                    buttoncolor: AppColors.white,
                    textcolor: AppColors.color9494),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
