import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessController extends GetxController {
  final TextEditingController businessDescriptionController =
      TextEditingController(); // Controller for the description input field

  // Observable list of businesses
  var sendmessagecontroller = TextEditingController().obs;
  RxList<Map<String, dynamic>> businessList = RxList<Map<String, dynamic>>([
    {
      "title": "Food",
      "image": "assets/foodimage.png",
    },
    {
      "title": "Restaurants",
      "image": "assets/restaruenticon.png",
    },
    {
      "title": "Clothing",
      "image": "assets/clothicon.png",
    },
    {
      "title": "Airports",
      "image": "assets/flighticon.png",
    },
    {
      "title": "Food",
      "image": "assets/foodimage.png",
    },
    {
      "title": "Restaurants",
      "image": "assets/restaruenticon.png",
    },
    {
      "title": "Clothing",
      "image": "assets/clothicon.png",
    },
    {
      "title": "Airports",
      "image": "assets/flighticon.png",
    },
  ]);
  List<Map<String, dynamic>> chatList = [
    {
      "isCurrentUser": true,
      "text": "Hey, how's it going?",
      "profileImage": "https://example.com/currentUserProfile.jpg",
      "userProfileImage": "assets/profile2.png",
      "time": "10:30 AM",
    },
    {
      "isCurrentUser": false,
      "text": "I'm good, thanks for asking! How about you?",
      "profileImage": "https://example.com/otherUserProfile.jpg",
      "userProfileImage": "assets/profile2.png",
      "time": "10:32 AM",
    },
    {
      "isCurrentUser": true,
      "text": "I'm doing great, just working on some projects.",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:35 AM",
    },
    {
      "isCurrentUser": false,
      "text": "That sounds awesome! What kind of projects?",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:37 AM",
    },
    {
      "isCurrentUser": true,
      "text": "I'm working on a Flutter app. It's a lot of fun!",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:40 AM",
    },
    {
      "isCurrentUser": false,
      "text": "Sounds cool! I'd love to check it out sometime.",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:45 AM",
    },
    {
      "isCurrentUser": true,
      "text": "Sure, I’ll send you the link once it’s ready.",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:50 AM",
    },
    {
      "isCurrentUser": false,
      "text": "Looking forward to it! Good luck with the app.",
      "profileImage": "assets/profileimage.png",
      "userProfileImage": "assets/profile2.png",
      "time": "10:55 AM",
    },
  ];

  RxList<Map<String, String>> campaignList = RxList<Map<String, String>>([
    {
      "campaign": "Campaign A",
      "reach": "120,850",
      "clicks": "93,500",
    },
    {
      "campaign": "Campaign B",
      "reach": "200,000",
      "clicks": "150,000",
    },
    {
      "campaign": "Campaign C",
      "reach": "300,000",
      "clicks": "250,000",
    },
    {
      "campaign": "Campaign D",
      "reach": "120,850",
      "clicks": "93,500",
    },
    {
      "campaign": "Campaign E",
      "reach": "200,000",
      "clicks": "150,000",
    },
    {
      "campaign": "Campaign F",
      "reach": "300,000",
      "clicks": "250,000",
    },
    // Add more campaigns as needed
  ]);
  // coupons code list complete
  RxList<Map<String, String>> couponslist = RxList<Map<String, String>>([
    {
      "sno": "01",
      "campaign": "2cd1v5v1r1",
      "reach": "120,850",
      "clicks": "93,500",
    },
    {
      "sno": "02",
      "campaign": "2cd555v1r1",
      "reach": "200,000",
      "clicks": "150,000",
    },
    {
      "sno": "03",
      "campaign": "2cd2212v1r1",
      "reach": "300,000",
      "clicks": "250,000",
    },
    {
      "sno": "04",
      "campaign": "2cd12321r1",
      "reach": "120,850",
      "clicks": "93,500",
    },
    {
      "sno": "05",
      "campaign": "2cd1v533v1r1",
      "reach": "200,000",
      "clicks": "150,000",
    },
    {
      "sno": "06",
      "campaign": "2cd1v5v1222",
      "reach": "300,000",
      "clicks": "250,000",
    },
    // Add more campaigns as needed
  ]);
  RxList<Map<String, String>> transactionlist = RxList<Map<String, String>>([
    {
      "profileImage": "assets/profile2.png", // Profile image path
      "campaign": "2cd1v5v1r1", // Campaign name
      "reach": "120,850", // Reach
      "clicks": "93,500", // Clicks
      "date": "11/12/23 08:32", // Date
      "amount": "\$203", // Amount
    },
    {
      "profileImage": "assets/profile2.png",
      "campaign": "2cd555v1r1",
      "reach": "200,000",
      "clicks": "150,000",
      "date": "11/12/23 09:45",
      "amount": "\$250",
    },
    {
      "profileImage": "assets/profile2.png",
      "campaign": "2cd2212v1r1",
      "reach": "300,000",
      "clicks": "250,000",
      "date": "11/12/23 10:00",
      "amount": "\$350",
    },

    // Add more campaigns as needed
  ]);

  RxList<Map<String, String>> chatlist = RxList<Map<String, String>>([
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
    // Add more transactions as needed
  ]);
  RxList<Map<String, dynamic>> reviewList = RxList<Map<String, dynamic>>([
    {
      'name': 'Austin Blake',
      'reviewText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      'rating': 3.0,
      'flagIconPath': 'assets/flagicon.svg',
    },
    {
      'name': 'John Doe',
      'reviewText':
          'This is another review text. It can be longer or shorter...',
      'rating': 2.5,
      'flagIconPath': 'assets/flagicon.svg',
    },
    // Add more reviews as needed...
  ]);
  final startdate = TextEditingController();
  final enddate = TextEditingController();
  // Add a new business dynamically
  void addBusiness(Map<String, dynamic> business) {
    businessList.add(business);
  }

  // Simulate fetching data from an API or a database
  Future<void> fetchBusinesses() async {
    await Future.delayed(Duration(seconds: 2));

    // Simulate new fetched data
    businessList.value = [
      {"title": "Real Estate", "image": "assets/realestateimage.png"},
      {"title": "Travel", "image": "assets/travelimage.png"},
    ];
  }

///////////seller noitification setting
  final RxBool sellerrealupdatenotificationSetting = false.obs;
  updatesellerrealupdatenotificationSettingSwitch(value) {
    sellerrealupdatenotificationSetting.value = value;
  }

  final RxBool sellerpromtiondealsnotificationSetting = false.obs;
  updatesellerPromtiondealsnotificationSettingSwitch(value) {
    sellerpromtiondealsnotificationSetting.value = value;
  }

  final RxBool sellerreminderalertsnotificationSetting = false.obs;
  updatesellerReminderAlertsnotificationSettingSwitch(value) {
    sellerreminderalertsnotificationSetting.value = value;
  }

  final RxBool sellerMessagenotificationSetting = false.obs;
  updatesellerMessagenotificationSettingSwitch(value) {
    sellerMessagenotificationSetting.value = value;
  }

  final RxBool sellerReviewnotificationSetting = false.obs;
  updatesellerReviewnotificationSettingSwitch(value) {
    sellerReviewnotificationSetting.value = value;
  }

  final RxBool sellerBookingnotificationSetting = false.obs;
  updatesellerBookingnotificationSettingSwitch(value) {
    sellerBookingnotificationSetting.value = value;
  }
}
