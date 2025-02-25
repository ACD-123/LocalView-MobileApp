import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/authenticationcontroller.dart';
import 'package:localview/customwidgets/customappbutton.dart';
import 'package:localview/customwidgets/customcircularprogress.dart';
import 'package:localview/customwidgets/customsnackbar.dart';
import 'package:localview/customwidgets/customtextformfield.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/authentication/loginscreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final loginController =
      Get.put(AuthenticationController(authRepo: Get.find()));
  late AnimationController _animationController;
  late Animation<double> _curveAnimation;
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginController.registerFirstNameController.value.clear();
    loginController.registerLastNameController.value.clear();
    loginController.registerEmailController.value.clear();
    loginController.registerPasswordController.value.clear();
    loginController.registerPhoneNumberController.value.clear();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 110.h,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedBuilder(
                  animation: _curveAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, 150 * (1 - _curveAnimation.value)),
                      child: CustomPaint(
                        size: const Size(double.infinity, 150),
                        painter: BottomCurvePainter(),
                        child: Padding(
                          padding: EdgeInsets.only(top: 65.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamily.helvetica,
                                    fontSize: 13.sp),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteConstants.loginscreen);
                                },
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.helvetica,
                                        fontSize: 13.sp)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signupFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 6.h),
                  Text(
                    'Join Our Adventure!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontFamily: FontFamily.joan,
                      color: AppColors.textcolor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Become part of a vibrant community where you can discover new places, share experiences, and book your next getaway—all in one convenient app.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.color9494,
                      fontFamily: FontFamily.helvetica,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextFormField(
                                  controller: loginController
                                      .registerFirstNameController.value,
                                  hinttext: "Jade",
                                  fieldtitle: "First Name",
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'First Name can\'t be empty';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customTextFormField(
                                  controller: loginController
                                      .registerLastNameController.value,
                                  hinttext: "Nicolas",
                                  fieldtitle: "Last Name",
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Last Name can\'t be empty';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  customTextFormField(
                    controller: loginController.registerEmailController.value,
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
                  SizedBox(height: 10.h),
                  customTextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    controller:
                        loginController.registerPhoneNumberController.value,
                    hinttext: "Phone Number",
                    fieldtitle: "Phone Number",
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Phone Number can\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => customTextFormField(
                      controller:
                          loginController.registerPasswordController.value,
                      hinttext: "**********************",
                      fieldtitle: "Password",
                      password: "true",
                      visibleiconontap: () {
                        loginController.toggleRegisterPasswordVisibility();
                      },
                      passwordvisible: loginController.registerPasswordVisible,
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
                      hinttext: "**********************",
                      fieldtitle: "Confirm Password",
                      password: "true",
                      visibleiconontap: () {
                        loginController
                            .toggleRegisterConfirmPasswordVisibility();
                      },
                      passwordvisible:
                          loginController.registerConfirmPasswordVisible,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (v !=
                            loginController
                                .registerPasswordController.value.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Obx(
                    () => loginController.registerloading.value
                        ? Center(
                            child: customCircularProgress(),
                          )
                        : customButton(
                            ontap: () {
                              if (_signupFormKey.currentState!.validate()) {
                                loginController.register();
                              }
                            },
                            text: "Sign Up"),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Or Sign up with',
                          style: TextStyle(
                              fontFamily: FontFamily.helvetica,
                              fontSize: 12.sp,
                              color: AppColors.color8484),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customSocialAuthButton(
                          ontap: () {
                            customSnackBar(message: "Coming Soon");
                          },
                          type: "google"),
                      customSocialAuthButton(
                          ontap: () {
                            customSnackBar(message: "Coming Soon");
                          },
                          type: "facebook"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////////custom Social Button
GestureDetector customSocialAuthButton(
    {required VoidCallback ontap, required String type}) {
  return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45.h,
        width: 130.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.sp),
          border: Border.all(color: AppColors.color2E2E.withOpacity(0.2)),
        ),
        child: type == "google"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/google.png",
                      height: 24, width: 24),
                  SizedBox(width: 8.w),
                  Text(
                    'Google',
                    style: TextStyle(
                        fontFamily: FontFamily.helvetica,
                        color: AppColors.color2E2E,
                        fontSize: 12.sp),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Facebook.png",
                      height: 24, width: 24), // Set image size
                  SizedBox(width: 8.w),
                  Text(
                    'Facebook',
                    style: TextStyle(
                        fontFamily: FontFamily.helvetica,
                        color: AppColors.color4285,
                        fontSize: 12.sp),
                  ),
                ],
              ),
      ));
}
