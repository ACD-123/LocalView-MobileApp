import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';

class SetupUploadProfileScreen extends StatefulWidget {
  const SetupUploadProfileScreen({super.key});

  @override
  State<SetupUploadProfileScreen> createState() =>
      _SetupUploadProfileScreenState();
}

class _SetupUploadProfileScreenState extends State<SetupUploadProfileScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Upload your profile",
            style: TextStyle(
                fontSize: 25.sp,
                fontFamily: FontFamily.joan,
                color: AppColors.maincolor),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            "Upload profile from your gallery.",
            style: TextStyle(
                fontSize: 12.sp,
                fontFamily: FontFamily.helvetica,
                color: AppColors.color9494),
          ),
          SizedBox(
            height: 40.h,
          ),
          Obx(
            () => CircleAvatar(
              radius: 100.sp,
              backgroundColor: Colors.transparent,
              backgroundImage:
                  authcontroller.setupuploadprofileimage.value != null
                      ? FileImage(authcontroller.setupuploadprofileimage.value!)
                          as ImageProvider
                      : const AssetImage("assets/images/blankimage.png"),
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          customButton(
              ontap: () {
                authcontroller.pickSetupUploadProfileImage(context);
              },
              text: "Choose from Gallery")
        ],
      ),
    );
  }
}
