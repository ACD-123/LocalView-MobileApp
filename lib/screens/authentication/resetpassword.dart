import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final authcontroller =
      Get.put(AuthenticationController(authRepo: Get.find()));
  final String? email = Get.arguments as String?;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    authcontroller.resetpasswordcontroller.value.clear();
    authcontroller.resetConfpasswordcontroller.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontFamily: FontFamily.joan,
                        color: AppColors.textcolor),
                  ),
                  Center(
                    child: Text(
                      "The password must be different than before",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: FontFamily.helvetica,
                          color: AppColors.greytheme),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(
                    () => customTextFormField(
                      controller: authcontroller.resetpasswordcontroller.value,
                      hinttext: "**********************",
                      fieldtitle: "New Password",
                      password: "true",
                      visibleiconontap: () {
                        authcontroller.toggleResetNewPasswordVisibility();
                      },
                      passwordvisible: authcontroller.resetnewPasswordVisible,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please Enter Your Password';
                        }
                        if (v.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        final RegExp regex =
                            RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
                        if (!regex.hasMatch(v)) {
                          return 'Password must have an uppercase letter and a digit';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => customTextFormField(
                      controller:
                          authcontroller.resetConfpasswordcontroller.value,
                      hinttext: "**********************",
                      fieldtitle: "Confirm New Password",
                      password: "true",
                      visibleiconontap: () {
                        authcontroller
                            .toggleResetNewConfirmPasswordVisibility();
                      },
                      passwordvisible:
                          authcontroller.resetnewConfirmPasswordVisible,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (v !=
                            authcontroller.resetpasswordcontroller.value.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Obx(() => authcontroller.resetPasswordloading.value
                      ? Center(
                          child: customCircularProgress(),
                        )
                      : customButton(
                          ontap: () {
                            if (formkey.currentState!.validate()) {
                              authcontroller.resetPassword(
                                  email: email.toString());
                            }
                          },
                          text: "Save"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
