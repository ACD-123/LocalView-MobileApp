import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/screens/authentication/forgotpassword.dart';

class ForgotEmailVerification extends StatefulWidget {
  const ForgotEmailVerification({super.key});

  @override
  State<ForgotEmailVerification> createState() =>
      _ForgotEmailVerificationdState();
}

final loginController = Get.put(AuthenticationController(authRepo: Get.find()));

class _ForgotEmailVerificationdState extends State<ForgotEmailVerification> {
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  @override
  void initState() {
    super.initState();
    loginController.emailverifyOTP.value = '';
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;
    final String? email = arguments?['email'];
    final int? type = arguments?['type'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Enter Verification Code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: FontFamily.joan,
                    color: AppColors.textcolor),
              ),
              Center(
                child: Text(
                  "We have sent a code to $email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.greytheme,
                      fontFamily: FontFamily.helvetica),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              OtpTextField(
                handleControllers: (controllers) {
                  for (var controller in controllers) {
                    controller?.addListener(() {
                      loginController.emailverifyOTP.value = controllers
                          .map((controller) => controller?.text ?? '')
                          .join('');
                    });
                  }
                },
                numberOfFields: 5,
                textStyle: const TextStyle(
                  color: AppColors.maincolor,
                ),
                borderColor: AppColors.lineargradient1,
                focusedBorderColor: AppColors.lineargradient1,
                showFieldAsBox: true,
                fieldWidth: 50.w,
                onSubmit: (String verificationCode) {
                  authcontroller.verifyOTP(
                    type: type.toString(),
                    email: email.toString(),
                  );
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(
                () => authcontroller.emailverifyOTPloading.value
                    ? Center(
                        child: customCircularProgress(),
                      )
                    : customButton(
                        ontap: () {
                          if (authcontroller.emailverifyOTP.value.isEmpty ||
                              authcontroller.emailverifyOTP.value.length < 5) {
                            customErrorSnackBar(
                                message: 'Please enter a 5-digit code.');
                          } else {
                            authcontroller.verifyOTP(
                              type: type.toString(),
                              email: email.toString(),
                            );
                          }
                        },
                        text: 'Confirm'),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you didn’t receive a code. ",
                    style:
                        TextStyle(color: AppColors.greytheme, fontSize: 12.sp),
                  ),
                  Obx(
                    () => authcontroller.sendOTPloading.value
                        ? Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: SizedBox(
                              height: 15.h,
                              width: 15.w,
                              child: customCircularProgress(),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              authcontroller.sendOTP(
                                  type: type.toString(),
                                  email: email.toString(),
                                  navigatetype: "");
                            },
                            child: Text(
                              "Resend code",
                              style: TextStyle(
                                  color: AppColors.lineargradient1,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: FontFamily.helvetica,
                                  fontSize: 12.sp),
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
