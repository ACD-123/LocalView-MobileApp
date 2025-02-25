import 'package:flutter/material.dart';
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
import 'package:localview/screens/authentication/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final loginController =
      Get.put(AuthenticationController(authRepo: Get.find()));

  late AnimationController _animationController;
  late Animation<double> _curveAnimation;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginController.loginemailcontroller.value.clear();
    loginController.loginpasswordcontroller.value.clear();
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
                          padding: EdgeInsets.only(top: 65.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamily.helvetica,
                                    fontSize: 13.sp),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteConstants.signupscreen);
                                },
                                child: Text('Signup',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _loginFormKey, // Attach the form key here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40.h),

                      Text(
                        'Join the Journey!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28.sp,
                            fontFamily: FontFamily.joan,
                            color: AppColors.textcolor),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Reconnect with your community, share experiences, and explore new destinations tailored just for you.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.color9494,
                          fontFamily: FontFamily.cairo,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      customTextFormField(
                        controller: loginController.loginemailcontroller.value,
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

                      SizedBox(height: 12.h),

                      SizedBox(height: 1.h),
                      Obx(
                        () => customTextFormField(
                          controller:
                              loginController.loginpasswordcontroller.value,
                          hinttext: "**********************",
                          fieldtitle: "Password",
                          password: "true",
                          visibleiconontap: () {
                            loginController.loginPasswordVisibility();
                          },
                          passwordvisible: loginController.loginpasswordvisible,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Password can\'t be empty';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 25.h),
                      Obx(
                        () => loginController.loginloading.value
                            ? Center(
                                child: customCircularProgress(),
                              )
                            : customButton(
                                ontap: () {
                                  if (_loginFormKey.currentState!.validate()) {
                                    loginController.login();
                                  }
                                },
                                text: "Login"),
                      ),
                      SizedBox(height: 2.h),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RouteConstants.forgotpassword);
                        },
                        child: Text(
                          'Forgot Your Password?',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: FontFamily.helvetica,
                              color: AppColors.textcolor),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or Sign up with',
                              style: TextStyle(
                                  fontFamily: FontFamily.helvetica,
                                  color: AppColors.color8484,
                                  fontSize: 12.sp),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 15.h),
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

                      // SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          AppColors.lineargradient1,
          AppColors.lineargradient2,
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(
          Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)))
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, 100, size.width, 0);

    double customHeight = 300.0;
    path.lineTo(size.width, customHeight);
    path.lineTo(0, customHeight);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
