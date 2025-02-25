import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class InAppChangePasswordScreen extends StatefulWidget {
  const InAppChangePasswordScreen({super.key});

  @override
  State<InAppChangePasswordScreen> createState() =>
      _InAppChangePasswordScreenState();
}

class _InAppChangePasswordScreenState extends State<InAppChangePasswordScreen> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar(
            title: "Change Password",
            ontap: () {
              Get.back();
            }),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    customTextFormField(
                        hinttext: "**********************",
                        fieldtitle: "Current Password",
                        password: "true",
                        passwordvisible:
                            authcontroller.inAppChangeCurrentPasswordVisible,
                        visibleiconontap: () {
                          authcontroller
                              .toggleinAppChangeCurrentPasswordVisibility();
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextFormField(
                        hinttext: "**********************",
                        fieldtitle: "New Password",
                        password: "true",
                        passwordvisible:
                            authcontroller.inAppChangeNewPasswordVisible,
                        visibleiconontap: () {
                          authcontroller
                              .toggleinAppChangeNewPasswordVisibility();
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextFormField(
                        hinttext: "**********************",
                        fieldtitle: "Confirm New Password",
                        password: "true",
                        passwordvisible:
                            authcontroller.inAppChangeConfirmPasswordVisible,
                        visibleiconontap: () {
                          authcontroller
                              .toggleinAppChangeConfirmPasswordVisibility();
                        }),
                    SizedBox(
                      height: 30.h,
                    ),
                    customButton(
                        ontap: () {
                          Get.back();
                        },
                        text: "Change")
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
