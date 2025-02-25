import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/appconstants.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/customwidgets/custombutton.dart';
import 'package:localview/helpers/routeconstants.dart';

class ChatsRoomDetails extends StatefulWidget {
  ChatsRoomDetails({Key? key}) : super(key: key);

  @override
  State<ChatsRoomDetails> createState() => _ChatsRoomDetailsState();
}

class _ChatsRoomDetailsState extends State<ChatsRoomDetails> {
  final ScrollController _scrollController = ScrollController();
  final BusinessController chatcontroller = Get.put(BusinessController());

  @override
  void initState() {
    super.initState();
    chatcontroller.sendmessagecontroller.value.clear();
  }

  // Function to show the bottom sheet
  void _showDeleteConfirmation() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you sure you want to block this user?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Yes Button
                  ElevetedButton(
                    gradientColors: [
                      AppColors.lineargradient1,
                      AppColors.lineargradient2
                    ],
                    textColor: Colors.white,
                    ontap: () {
                      Get.toNamed(RouteConstants.uploadingbussiness);
                    },
                    buttonName: 'Yes',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Cancel Button
                  ElevetedButton(
                    borderColor: Colors.grey,
                    color: Colors.white,
                    textColor: Colors.black,
                    ontap: () {
                      Get.toNamed(RouteConstants.uploadingbussiness);
                    },
                    buttonName: 'Cancel',
                  ),
                  // Cancel Button
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "Chat Room",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: GestureDetector(
              onTap: () {
                // Show bottom sheet on delete icon tap
                _showDeleteConfirmation();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/deleteicon.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: chatcontroller.chatList.length,
              itemBuilder: (context, index) {
                final message = chatcontroller.chatList[index];

                return ChatBubble(
                  text: message['text'],
                  isCurrentUser: message['isCurrentUser'],
                  profileImage: message['profileImage'],
                  userprofileimage: message['userProfileImage'],
                );
              },
            ),
            SizedBox(
              height: 70.h,
            ),
            // Chat Input Section
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ChatInput(
                sendmessageontap: () async {
                  if (chatcontroller
                      .sendmessagecontroller.value.text.isNotEmpty) {
                    print(
                        "Message Sent: ${chatcontroller.sendmessagecontroller.value.text}");
                    // Add your message sending logic here
                    chatcontroller.sendmessagecontroller.value.clear();
                  }
                },
                donesendmessageontap: () async {
                  if (chatcontroller
                      .sendmessagecontroller.value.text.isNotEmpty) {
                    print(
                        "Message Sent: ${chatcontroller.sendmessagecontroller.value.text}");
                    // Add your message sending logic here
                    chatcontroller.sendmessagecontroller.value.clear();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isCurrentUser;
  final String profileImage;
  final String userprofileimage;

  ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
    required this.profileImage,
    required this.userprofileimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: Row(
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Show profile image for non-current user
          if (!isCurrentUser)
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  profileImage.isEmpty
                      ? AppConstants.noprofileimage
                      : profileImage,
                ),
              ),
            ),
          // Message bubble
          Flexible(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: isCurrentUser
                    ? LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.grey
                        ], // Grey for current user
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : LinearGradient(
                        colors: [
                          AppColors.lineargradient1,
                          AppColors.lineargradient2
                        ], // Gradient for other users
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                borderRadius: isCurrentUser
                    ? BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(10),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ),
          // Show current user's profile image
          if (isCurrentUser)
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  userprofileimage.isEmpty
                      ? AppConstants.noprofileimage
                      : userprofileimage,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ChatInput extends StatefulWidget {
  final VoidCallback sendmessageontap;
  final VoidCallback donesendmessageontap;

  ChatInput({
    Key? key,
    required this.sendmessageontap,
    required this.donesendmessageontap,
  }) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final BusinessController chatcontroller = Get.put(BusinessController());
  late TextEditingController _controller;
  late ValueNotifier<bool> _isSendVisible;

  @override
  void initState() {
    super.initState();
    _controller = chatcontroller.sendmessagecontroller.value;
    _isSendVisible = ValueNotifier(_controller.text.isNotEmpty);
    _controller.addListener(() {
      _isSendVisible.value = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _controller,
                onFieldSubmitted: (_) => widget.donesendmessageontap(),
                decoration: InputDecoration(
                  hintText: 'Message',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Image.asset("assets/Vector.png"),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isSendVisible,
            builder: (context, isSendVisible, child) {
              return isSendVisible
                  ? InkWell(
                      onTap: widget.sendmessageontap,
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Image.asset('assets/Vector.png'),
                      ),
                    )
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
