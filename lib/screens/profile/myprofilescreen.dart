import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    authcontroller.updateprofileFirstNameController.value.clear();
    authcontroller.updateprofileLastNameController.value.clear();
    authcontroller.updateprofilePhoneController.value.clear();
    authcontroller.uploadupdateMyProfileimage.value = null;
    authcontroller.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'My Profile',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
            child: Obx(
          () => authcontroller.getProfileDataloading.value
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 250.h),
                  child: Center(
                    child: customCircularProgress(),
                  ),
                )
              : authcontroller.getprofiledata.value == null ||
                      authcontroller.getprofiledata.value?.data == null
                  ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 250.h),
                      child: Center(
                        child:
                            customNotDataText(text: "Profile Detail Not Found"),
                      ),
                    )
                  : Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CircleAvatar(
                                radius: 50.sp,
                                backgroundImage: authcontroller
                                            .uploadupdateMyProfileimage.value !=
                                        null
                                    ? FileImage(authcontroller
                                        .uploadupdateMyProfileimage.value!)
                                    : authcontroller.getprofiledata.value?.data
                                                    ?.media ==
                                                null ||
                                            authcontroller.getprofiledata.value!
                                                .data!.media!.isEmpty
                                        ? const NetworkImage(
                                            AppConstants.noprofileimage)
                                        : NetworkImage(authcontroller
                                                    .getprofiledata
                                                    .value
                                                    ?.data
                                                    ?.media
                                                    ?.first
                                                    .originalUrl
                                                    .toString() ??
                                                AppConstants.noprofileimage)
                                            as ImageProvider,
                              ),
                              Positioned(
                                right: -1.w,
                                bottom: -1.h,
                                child: GestureDetector(
                                  onTap: () {
                                    authcontroller
                                        .pickupdateMyProfileImage(context);
                                  },
                                  child: CircleAvatar(
                                      radius: 13.sp,
                                      backgroundColor: AppColors.maincolor,
                                      child: Icon(
                                        Icons.photo_camera_rounded,
                                        size: 15.sp,
                                        color: AppColors.white,
                                      )),
                                ),
                              )
                            ],
                          )),
                          SizedBox(
                            height: 15.h,
                          ),
                          customTextFormField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Please enter first name';
                                }
                                return null;
                              },
                              controller: authcontroller
                                  .updateprofileFirstNameController.value,
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 20.sp,
                              ),
                              hinttext: "Nicolas",
                              fieldtitle: "First Name"),
                          SizedBox(
                            height: 15.h,
                          ),
                          customTextFormField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Please enter last name';
                                }
                                return null;
                              },
                              controller: authcontroller
                                  .updateprofileLastNameController.value,
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 20.sp,
                              ),
                              hinttext: "Wade",
                              fieldtitle: "Last Name"),
                          SizedBox(
                            height: 15.h,
                          ),
                          customTextFormField(
                              enabled: false,
                              hinttext: authcontroller
                                      .getprofiledata.value?.data?.email
                                      .toString() ??
                                  "",
                              fieldtitle: "Email Address"),
                          SizedBox(
                            height: 15.h,
                          ),
                          customTextFormField(
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Please enter phone number';
                                }
                                return null;
                              },
                              controller: authcontroller
                                  .updateprofilePhoneController.value,
                              suffixIcon: Icon(
                                Icons.edit,
                                size: 20.sp,
                              ),
                              hinttext: "123 456 789 0",
                              fieldtitle: "Phone Number",
                              keyboardType: TextInputType.number,
                              inputFormatter:
                                  FilteringTextInputFormatter.digitsOnly),
                          SizedBox(
                            height: 50.h,
                          ),
                          authcontroller.updateProfileDataloading.value
                              ? Center(
                                  child: customCircularProgress(),
                                )
                              : customButton(
                                  ontap: () {
                                    if (formkey.currentState!.validate()) {
                                      authcontroller.updateProfileData();
                                    }
                                  },
                                  text: "Update"),
                          SizedBox(
                            height: 12.h,
                          ),
                        ],
                      ),
                    ),
        )),
      ),
    );
  }
}
