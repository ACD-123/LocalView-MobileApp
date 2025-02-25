import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final loginController = Get.put(AuthenticationController(authRepo: Get.find()));
final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
final authcontroller = Get.put(AuthenticationController(authRepo: Get.find()));

class _ForgotPasswordState extends State<ForgotPassword> {
  void _dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    authcontroller.sendOTPemailcontroller.value.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: _dismissKeyboard,
          child: SingleChildScrollView(
            child: Form(
              key: forgetPasswordFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Forget Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: FontFamily.joan,
                          color: AppColors.textcolor),
                    ),
                    SizedBox(height: 1.h),
                    Center(
                      child: Text(
                        "Enter Your Email Address to Reset your password",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.greytheme,
                          fontFamily: FontFamily.helvetica,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    customTextFormField(
                      controller: authcontroller.sendOTPemailcontroller.value,
                      hinttext: "nicolas@gmail.com",
                      fieldtitle: "Email Address",
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Email can\'t be empty';
                        } else if (!v.isEmail) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    Obx(() => authcontroller.sendOTPloading.value
                        ? Center(
                            child: customCircularProgress(),
                          )
                        : customButton(
                            ontap: () {
                              if (forgetPasswordFormKey.currentState!
                                  .validate()) {
                                authcontroller.sendOTP(
                                    type: "1",
                                    email: authcontroller
                                        .sendOTPemailcontroller.value.text
                                        .toString(),
                                    navigatetype: "send");
                              }
                            },
                            text: "Send Code"))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
