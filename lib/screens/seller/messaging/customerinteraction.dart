import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/controller/bussinescontroller.dart';
import 'package:localview/helpers/routeconstants.dart';

import '../../../customwidgets/customappbar.dart';

class CustomerInteractionScreen extends StatefulWidget {
  const CustomerInteractionScreen({super.key});

  @override
  State<CustomerInteractionScreen> createState() =>
      _CustomerInteractionScreenState();
}

class _CustomerInteractionScreenState extends State<CustomerInteractionScreen> {
  final BusinessController businessController = Get.put(BusinessController());

  /// Stores the selected subscription box
  String selectedSubscription = 'General'; // Default to General

  // Sample list of interactions, this will come from your controller in real app
  RxList<Map<String, String>> interactions = RxList<Map<String, String>>([
    {
      "profileImage": "assets/profile2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15",
    },
    {
      "profileImage": "assets/profile2.png",
      "name": "Sarah Lee",
      "message": "I need help with my order from yesterday.",
      "time": "10:45",
    },
    // Add more interactions as needed
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
          title: 'Customer Interaction',
          ontap: () {
            Get.back();
          }),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSubscriptionBox('General'),
                  SizedBox(
                    width: 12.w,
                  ),
                  _buildSubscriptionBox('Message Request'),
                  SizedBox(
                    width: 12.w,
                  ),
                  _buildSubscriptionBox('Block Users'),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            // ListView of Customer Interactions
            Obx(() {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: interactions.length,
                  itemBuilder: (context, index) {
                    final interaction = interactions[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the next page when an item is tapped

                        Get.toNamed(RouteConstants.chatdetails);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.only(bottom: 1.0),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(interaction["profileImage"]!),
                        ),
                        title: Row(
                          children: [
                            Text(
                              interaction["name"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lineargradient1,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              interaction["time"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lineargradient1,
                                fontFamily: AppColors.helvetica,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          interaction["message"]!,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppColors.helvetica,
                          ),
                        ),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // Helper widget to build subscription boxes
  Widget _buildSubscriptionBox(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSubscription = label; // Set selected subscription
        });
      },
      child: Container(
        width: label == 'MessageRequest' ? 120.w : 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: selectedSubscription == label
                  ? Colors.transparent
                  : Colors.black), // Selected box has no border
          color: selectedSubscription == label
              ? AppColors.lineargradient1
              : Colors.transparent, // Selected box has color
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontFamily: AppColors.helvetica,
              color: selectedSubscription == label
                  ? Colors.white
                  : Colors.black, // Text color changes when selected
            ),
          ),
        ),
      ),
    );
  }
}
