import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';
import 'package:localview/controller/componentcontroller.dart';
import 'package:localview/customwidgets/customtextformfield.dart';

class UserChatDetailScreen extends StatefulWidget {
  const UserChatDetailScreen({super.key});

  @override
  State<UserChatDetailScreen> createState() => _UserChatDetailScreenState();
}

class _UserChatDetailScreenState extends State<UserChatDetailScreen> {
  final componentcontroller = Get.put(ComponentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.close,
              size: 22.sp,
              color: AppColors.maincolor,
            )),
        title: Column(
          children: [
            Text(
              "Austin Blake",
              style: TextStyle(
                  fontFamily: FontFamily.joan,
                  color: AppColors.color1212,
                  fontSize: 17.sp),
            ),
            Text(
              "Last Seen 2 mins ago",
              style: TextStyle(
                  fontFamily: FontFamily.helvetica,
                  color: AppColors.color9494,
                  fontSize: 11.sp),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: componentcontroller.chatdetaillist.length,
                itemBuilder: (context, index) {
                  final chatdetail = componentcontroller.chatdetaillist[index];
                  return ChatBox(
                    time: chatdetail["time"],
                    isCurrentUser: chatdetail["isCurrentUser"],
                    profileImage: chatdetail["profileImage"],
                    sendeImage: chatdetail["userProfileImage"],
                    messageImageslist: chatdetail["text"],
                  );
                }),
            const Spacer(),
            customTextFormField(
                hinttext: "Type your message",
                suffixIcon: Transform.scale(
                    scale: 0.4.sp,
                    child: Image.asset(
                      "assets/images/sendmessageicon.png",
                      height: 15.h,
                      width: 15.w,
                      fit: BoxFit.fill,
                    )))
          ],
        ),
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  ChatBox({
    Key? key,
    required this.time,
    required this.isCurrentUser,
    required this.profileImage,
    required this.sendeImage,
    required this.messageImageslist,
  }) : super(key: key);
  final String time;
  final bool isCurrentUser;
  final String profileImage;
  final String sendeImage;
  final String messageImageslist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            isCurrentUser ? 80.w : 15.w,
            11,
            isCurrentUser ? 15.w : 80.w,
            11,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isCurrentUser)
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: AppColors.color9494,
                    backgroundImage: AssetImage(sendeImage),
                  ),
                ),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color:
                          isCurrentUser ? AppColors.maincolor : AppColors.white,
                      border: Border.all(
                          color: AppColors.color9494.withOpacity(0.2)),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.sp),
                          bottomLeft: Radius.circular(20.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 15, left: 12, bottom: 6, top: 5.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(messageImageslist,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: isCurrentUser
                                      ? AppColors.white
                                      : AppColors.color8484)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 15, left: 12, bottom: 6, top: 5.h),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(time,
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  color: isCurrentUser
                                      ? AppColors.white
                                      : AppColors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isCurrentUser)
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: CircleAvatar(
                    radius: 18.sp,
                    backgroundColor: AppColors.color9494,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
