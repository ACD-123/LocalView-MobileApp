import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/customwidgets/custombutton.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  /// Stores the selected social media platform
  String? selectedPlatform;
  String? selectedPlatformIcon;

  /// List of social media platforms with their icons
  final List<Map<String, String>> socialMediaPlatforms = [
    {
      "name": "Facebook",
    },
    {
      "name": "Instagram",
    },
    {
      "name": "Threads",
    },
    {
      "name": "Twitter",
    },
    {
      "name": "YouTube",
    },
    {
      "name": "TikTok",
    },
    {
      "name": "Twitch",
    },
    {
      "name": "WhatsApp",
    },
    {
      "name": "LINE",
    },
    {
      "name": "WeChat",
    },
    {
      "name": "Pinterest",
    },
    {
      "name": "Spotify",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Social Media Integrations',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Social Media Links",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),

              /// **Platform Selection Dropdown**
              GestureDetector(
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: selectedPlatformIcon != null ? 10 : 0),
                          Text(
                            selectedPlatform ?? "Platform",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppColors.helvetica,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15.h),
              Text(
                "Website Link",
                style: TextStyle(
                  fontFamily: AppColors.helvetica,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),

              /// **Website Link Input Field**
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.greytheme, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.greytheme, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.greytheme, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 18.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.greytheme, width: 1.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'www.${selectedPlatform?.toLowerCase()}.com',
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/Facebook.svg",
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 290.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Color(0xff949494),
                                ),
                              ),
                              Text(
                                "www.facebook.com",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Copy",
                            style: TextStyle(
                              fontFamily: AppColors.helvetica,
                              fontSize: 14,
                              color: AppColors.lineargradient1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/instagram.svg",
                    height: 22.h,
                    width: 22.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 290.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Instagram",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Color(0xff949494),
                                ),
                              ),
                              Text(
                                "www.facebook.com",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Copy",
                            style: TextStyle(
                              fontFamily: AppColors.helvetica,
                              fontSize: 14,
                              color: AppColors.lineargradient1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/twitter.svg",
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    width: 285.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Twitter",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Color(0xff949494),
                                ),
                              ),
                              Text(
                                "www.twitter.com",
                                style: TextStyle(
                                  fontFamily: AppColors.helvetica,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Copy",
                            style: TextStyle(
                              fontFamily: AppColors.helvetica,
                              fontSize: 14,
                              color: AppColors.lineargradient1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevetedButton(
                gradientColors: [
                  AppColors.lineargradient1,
                  AppColors.lineargradient2
                ],
                textColor: Colors.white,
                ontap: () {
                  Get.back();
                  // if (loginController
                  //         .signupemailverificationotp.value.isEmpty ||
                  //     loginController
                  //             .signupemailverificationotp.value.length <
                  //         5) {
                  //   showErrrorSnackbar(
                  //       message: 'Please enter a 5-digit code.');
                  // } else {
                  //   loginController.emailVerification(
                  //     type: "1",
                  //     otp: loginController
                  //         .signupemailverificationotp.value
                  //         .toString(),
                  //     isUser: isUser,
                  //     email: email,
                  //     context: context,
                  //   );
                  // }
                },
                buttonName: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Bottom Sheet for Social Media Selection**
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: socialMediaPlatforms.map((platform) {
                return ListTile(
                  title: Text(platform["name"]!),
                  onTap: () {
                    setState(() {
                      selectedPlatform = platform["name"];
                      selectedPlatformIcon = platform["icon"];
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
