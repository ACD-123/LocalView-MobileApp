

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/seller/bussinessprofile/addadressscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/bussinesinformation.dart';
import 'package:localview/screens/seller/bussinessprofile/createbusinessprofile.dart';
import 'package:localview/screens/seller/bussinessprofile/uploadbussinesscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/verificationdocument.dart';

class ComponentController extends GetxController {
  final RxList<Map<String, dynamic>> notificationlist = [
    {
      "title": "Booking Confirmation",
      "description":
          "Your flight to New York has been confirmed! Departure: 3:30 PM, November 15th. Check your email for details.",
      "time": "9:35 am",
      "image": "assets/images/planicon.png"
    },
    {
      "title": "Hotel Reservation Update",
      "description":
          "Your hotel booking at the Grand Plaza is now confirmed. Check-in time: 2:00 PM, November 17th. Have a pleasant stay!",
      "time": "10:00 am",
      "image": "assets/images/hotelicon.png"
    },
    {
      "title": "Upcoming Flight Reminder",
      "description":
          "Reminder: Your flight from Miami to Cancun departs in 24 hours. Please check in online to save time!",
      "time": "9:15 pm",
      "image": "assets/images/planicon.png"
    },
    {
      "title": "Order Confirmation",
      "description":
          "Your order from Bella Pizza is confirmed! It will arrive in 30 minutes. Enjoy your meal",
      "time": "9:35 am",
      "image": "assets/images/foodicon.png"
    },
  ].obs;

/////////////blogs news list
  final RxList<Map<String, dynamic>> blogsnewslist = [
    {
      "name": "All",
    },
    {
      "name": "Technology",
    },
    {
      "name": "Business",
    },
    {
      "name": "Lifestyle",
    },
    {"name": "Travel"},
    {"name": "Health"},
    {"name": "Entertainment"}
  ].obs;

/////////blogs news selected category
  final RxInt blogsnewsselectedcategory = 0.obs;

/////////blogs news list
  final RxList<Map<String, dynamic>> blogsnewlist = [
    {
      "title": "Augmented Reality Trends for 2022",
      "category": "Technology",
      "date": "Jan 4, 2022",
      "views": "3344",
      "image": "assets/images/blogsimage1.png"
    },
    {
      "title": "Stocks making the biggest moves midday: Tesla...",
      "category": "Business",
      "date": "Jan 1, 2022",
      "views": "9823",
      "image": "assets/images/blogsimage2.png"
    },
    {
      "title": "Augmented Reality Trends for 2022",
      "category": "Technology",
      "date": "Jan 4, 2022",
      "views": "3344",
      "image": "assets/images/blogsimage1.png"
    },
    {
      "title": "New VR Headsets That Will Shape the Metaverse",
      "category": "Business",
      "date": "Jan 1, 2022",
      "views": "9823",
      "image": "assets/images/blogsimage3.png"
    },
    {
      "title": "How the metaverse could impact the world..",
      "category": "Technology",
      "date": "Jan 4, 2022",
      "views": "3344",
      "image": "assets/images/blogsimage4.png"
    },
    {
      "title": "New VR Headsets That Will Shape the Metaverse",
      "category": "Business",
      "date": "Jan 1, 2022",
      "views": "9823",
      "image": "assets/images/blogsimage3.png"
    },
    {
      "title": "How the metaverse could impact the world..",
      "category": "Technology",
      "date": "Jan 4, 2022",
      "views": "3344",
      "image": "assets/images/blogsimage4.png"
    },
  ].obs;

///////////languages list
  final RxList<Map<String, dynamic>> languageslist = [
    {"name": "English (UK)"},
    {"name": "English (US)"},
  ].obs;

//////////////home search result icon
  final RxBool homeSearchResultIcon = false.obs;

//////////showing result list
  final RxList<Map<String, dynamic>> showingresultlist = [
    {
      "title": "Los Angeles International Airport",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage5.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "The Silver Oak",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage2.png",
      "rating": 3,
      "ratingcount": "2.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Étoile D'Or (Golden Star)",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage3.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Los Angeles International Airport",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage5.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage5.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Los Angeles International Airport",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "The Silver Oak",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage2.png",
      "rating": 3,
      "ratingcount": "2.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Étoile D'Or (Golden Star)",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage3.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Los Angeles International Airport",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "Restaurant",
      "image": "assets/images/favimage5.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "open",
      "distance": "Open 24 hours"
    },
  ].obs;

////////////reviews list
  final RxList<Map<String, dynamic>> reviewslist = [
    {
      "name": "Austin Blake",
      "image": "assets/images/reviewprofileimage1.png",
      "rating": 4,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "name": "Alina Grace",
      "image": "assets/images/reviewprofileimage2.png",
      "rating": 3,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "name": "Adam Scott",
      "image": "assets/images/reviewprofileimage3.png",
      "rating": 1,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "name": "Austin Blake",
      "image": "assets/images/reviewprofileimage1.png",
      "rating": 5,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "name": "Alina Grace",
      "image": "assets/images/reviewprofileimage2.png",
      "rating": 3,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "name": "Adam Scott",
      "image": "assets/images/reviewprofileimage3.png",
      "rating": 4,
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
  ].obs;

///////////discountlist
  final RxList<Map<String, dynamic>> discountlist = [
    {
      "discount": "50% Discount",
      "image": "assets/images/discountimage1.png",
      "description":
          "Get 50% OFF on every order every Friday. Don't miss out—treat yourself to deliciousness at half the price!",
    },
    {
      "discount": "40% OFF All Combos!",
      "image": "assets/images/discountimage2.png",
      "description":
          "Start your weekend with a bang—get 40% OFF all combo meals this Friday only!",
    },
    {
      "discount": "50% Discount",
      "image": "assets/images/discountimage1.png",
      "description":
          "Get 50% OFF on every order every Friday. Don't miss out—treat yourself to deliciousness at half the price!",
    },
    {
      "discount": "40% OFF All Combos!",
      "image": "assets/images/discountimage2.png",
      "description":
          "Start your weekend with a bang—get 40% OFF all combo meals this Friday only!",
    },
    {
      "discount": "50% Discount",
      "image": "assets/images/discountimage1.png",
      "description":
          "Get 50% OFF on every order every Friday. Don't miss out—treat yourself to deliciousness at half the price!",
    },
    {
      "discount": "40% OFF All Combos!",
      "image": "assets/images/discountimage2.png",
      "description":
          "Start your weekend with a bang—get 40% OFF all combo meals this Friday only!",
    },
  ].obs;

///////////filter price value
  var filtercurrentRangeValues = const RangeValues(5, 500).obs;

  final double filterstartPrice = 5;
  final double filterendPrice = 500;

  void updateFilterRangeValues(RangeValues values) {
    filtercurrentRangeValues.value = values;
  }




////////////////notification screen
  final RxBool realupdatenotificationSetting = false.obs;
  updaterealupdatenotificationSettingSwitch(value) {
    realupdatenotificationSetting.value = value;
  }

  final RxBool promtiondealsnotificationSetting = false.obs;
  updatePromtiondealsnotificationSettingSwitch(value) {
    promtiondealsnotificationSetting.value = value;
  }

  final RxBool reminderalertsnotificationSetting = false.obs;
  updateReminderAlertsnotificationSettingSwitch(value) {
    reminderalertsnotificationSetting.value = value;
  }

/////////filter screen sort by selected
  final RxString filterscreensortBySelectd = "".obs;
  updateFilterScreensortBySelected(String value) {
    filterscreensortBySelectd.value = value;
  }

  final RxString filterscreenHoursSelectd = "".obs;
  updateFilterScreenHoursSelected(String value) {
    filterscreenHoursSelectd.value = value;
  }

//////////showing result
  final RxString showingResulttabSelectd = "".obs;
  updateShowingResultSelected(String value) {
    showingResulttabSelectd.value = value;
  }


/////////filter screen
final RxString filterscreenRatingSelected = "".obs;
  updateFilterScreenRatingSelected(String value) {
    filterscreenRatingSelected.value = value;
  }


//////////faqs questions
  final RxList<String> faqsquestion = [
    "What is Local View?",
    "How do I find businesses near me?",
    "Can I leave reviews for businesses?",
    "Is Local View free to use?",
    "How do I register my business on Local View?",
    "What benefits does app offer for vendors?",
    "Is there a fee for listing my business?"
  ].obs;


/////////addresses list
final RxInt selectedaddress = 0.obs;
final RxList<Map<String, dynamic>> addresseslist = [
  {
    "type": "Home",
    "address": "1600 Amphitheatre Parkway",
    "city": "Mountain View",
    "country": "USA",
    "zipcode": "94043",
  },
  {
    "type": "Work",
    "address": "1 Apple Park Way",
    "city": "Cupertino",
    "country": "USA",
    "zipcode": "95014",
  },
  {
    "type": "Office",
    "address": "350 Fifth Avenue",
    "city": "New York",
    "country": "USA",
    "zipcode": "10118",
  },
  {
    "type": "Apartment",
    "address": "233 S Wacker Dr",
    "city": "Chicago",
    "country": "USA",
    "zipcode": "60606",
  },
  {
    "type": "Vacation Home",
    "address": "500 S Buena Vista St",
    "city": "Burbank",
    "country": "USA",
    "zipcode": "91521",
  },
].obs;



/////////////become a seller switch

final RxBool becomeasellerswitch = false.obs;
  updateBecomeASellerSwitch(value) {
    becomeasellerswitch.value = value;
 
  }



///////seller create business stepper
 final PageController sellercreatebusinesspageController = PageController();
  RxInt sellercreatebusinesscurrentPage = 0.obs;
  final sellercreatebusinesspages = [
  Selectyourbusiness(),
  BusinessInformation(),
  UploadbusinesScreen(),
  AddAddressScreem(),
  VerifyDocumentsScreen()
  ];

  void sellercreatebusinessToNextPage() {
    if (sellercreatebusinesscurrentPage < sellercreatebusinesspages.length - 1) {
      sellercreatebusinesspageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed(RouteConstants.subscriptionscreen);
    }
  }

///////////chat list 
 RxList<Map<String, String>> chatlist = RxList<Map<String, String>>([
    {
      "profileImage":"assets/images/reviewprofileimage2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56",
      "count": "5",
    },
    {
      "profileImage": "assets/images/reviewprofileimage1.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15", "count": "",
    },
    {
      "profileImage":"assets/images/reviewprofileimage2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56", "count": "",
    },
    {
      "profileImage": "assets/images/reviewprofileimage1.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15","count": "",
    },
    {
      "profileImage": "assets/images/reviewprofileimage2.png",
      "name": "Austin Blake",
      "message": "Hi! I’d like to make a reservation for dinner...",
      "time": "9:56","count": "",
    },
    {
      "profileImage": "assets/images/reviewprofileimage1.png",
      "name": "John Doe",
      "message": "Can we schedule a meeting for next week?",
      "time": "10:15","count": "",
    },
    {
      "profileImage": "assets/images/reviewprofileimage2.png",
      "name": "Sarah Lee",
      "message": "I need help with my order from yesterday.",
      "time": "10:45","count": "",
    },
  ]);


//////chat detail messages
List<Map<String, dynamic>> chatdetaillist = [
    {
      "isCurrentUser": true,
      "text": "Hi! I’d like to make a reservation for dinner tonight. Do you have any tables available for two people around 7 p.m.?",
      "profileImage":"assets/images/reviewprofileimage2.png",
      "userProfileImage": "assets/images/reviewprofileimage2.png",
      "time": "10:30 AM",
    },
    {
      "isCurrentUser": false,
      "text": "Hello! Let me check... Yes, we have a table for two available at 7 p.m. Would you like me to book that for you?",
      "profileImage": "assets/images/reviewprofileimage1.png",
      "userProfileImage":"assets/images/reviewprofileimage1.png",
      "time": "10:32 AM",
    },
    {
      "isCurrentUser": true,
      "text": "Yes, please! Thank you so much.",
      "profileImage": "assets/images/reviewprofileimage2.png",
      "userProfileImage":"assets/images/reviewprofileimage1.png",
      "time": "10:35 AM",
    },
    
  ];

}
