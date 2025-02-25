import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final isSeller = prefs.getBool('becomeaseller');
    if (token == null || token.isEmpty) {
      Get.offAllNamed(RouteConstants.onboardingscreen);
    } else {
      isSeller == true
          ? Get.offAllNamed(RouteConstants.sellercreatebusinesstepper)
          : Get.offAllNamed(RouteConstants.homescreen);
    }
  }

  @override
  void initState() {
    super.initState();

    // Navigate to the LoginScreen after 4 seconds
    Timer(
      const Duration(seconds: 2),
      () {
        splashNavigate();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lineargradient1,
              AppColors.lineargradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/splashlogo.png', // Replace with your logo
            // width: 150,
            // height: 150,
          ),
        ),
      ),
    );
  }
}
