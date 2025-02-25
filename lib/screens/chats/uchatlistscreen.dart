import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customappbar.dart';
import 'package:localview/helpers/routeconstants.dart';

class UserChatListScreen extends StatefulWidget {
  const UserChatListScreen({super.key});

  @override
  State<UserChatListScreen> createState() => _UserChatListScreenState();
}

class _UserChatListScreenState extends State<UserChatListScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Messages',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: componentcontroller.chatlist.length,
                itemBuilder: (context, index) {
                  final chatdata = componentcontroller.chatlist[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteConstants.userchatdetailscreen);
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 25.sp,
                                backgroundImage:
                                    AssetImage(chatdata['profileImage'] ?? ""),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 238.w,
                                          child: Text(
                                            chatdata['name'] ?? "",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.maincolor,
                                                fontFamily:
                                                    FontFamily.helvetica),
                                          )),
                                      Text(
                                        chatdata['time'] ?? "",
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color: AppColors.black,
                                            fontFamily: FontFamily.helvetica),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 240.w,
                                        child: Text(
                                          'Hi! I’d like to make a reservation for dinner...',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 11.sp,
                                              color: AppColors.black,
                                              fontFamily: FontFamily.helvetica),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      chatdata['count'] == null ||
                                              chatdata['count']!.isEmpty
                                          ? const SizedBox()
                                          : CircleAvatar(
                                              radius: 10.sp,
                                              backgroundColor:
                                                  AppColors.colorFF24,
                                              child: Text(
                                                chatdata['count'] ?? "",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 11.sp,
                                                    color: AppColors.white,
                                                    fontFamily:
                                                        FontFamily.helvetica),
                                              ),
                                            )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          color: AppColors.colorF2F2,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
