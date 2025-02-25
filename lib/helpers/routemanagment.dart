import 'package:get/get.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/screens/authentication/forgotemailverification.dart';
import 'package:localview/screens/authentication/forgotpassword.dart';
import 'package:localview/screens/authentication/loginscreen.dart';
import 'package:localview/screens/authentication/onboardingscreen.dart';
import 'package:localview/screens/authentication/resetpassword.dart';
import 'package:localview/screens/authentication/signupscreen.dart';
import 'package:localview/screens/authentication/splashscreen.dart';
import 'package:localview/screens/chats/uchatlistscreen.dart';
import 'package:localview/screens/chats/userchatdetailscreen.dart';
import 'package:localview/screens/home/filterscreen.dart';
import 'package:localview/screens/home/homescreen.dart';
import 'package:localview/screens/home/homesearchscreen.dart';
import 'package:localview/screens/home/reservationscreen.dart';
import 'package:localview/screens/home/sendfeedbackscreen.dart';
import 'package:localview/screens/profile/addaddressmapscreen.dart';
import 'package:localview/screens/profile/addressesscreen.dart';
import 'package:localview/screens/profile/blogsnewsdetailsscreen.dart';
import 'package:localview/screens/profile/blogsnewsscreen.dart';
import 'package:localview/screens/profile/bookingsreservationscreen.dart';
import 'package:localview/screens/profile/favouritesscreen.dart';
import 'package:localview/screens/profile/helpsupport/faqdetailscreen.dart';
import 'package:localview/screens/profile/helpsupport/aboutusscreen.dart';
import 'package:localview/screens/profile/helpsupport/faqsscreen.dart';
import 'package:localview/screens/profile/helpsupport/getaquotescreen.dart';
import 'package:localview/screens/profile/helpsupport/helpsupportscreen.dart';
import 'package:localview/screens/profile/inappchangepasswordscreen.dart';
import 'package:localview/screens/profile/myprofilescreen.dart';
import 'package:localview/screens/profile/notificationscreen.dart';
import 'package:localview/screens/profile/notificationsettingscreen.dart';
import 'package:localview/screens/profile/savedscreen.dart';
import 'package:localview/screens/profile/settingscreen.dart';
import 'package:localview/screens/seller/advertistingscreen.dart';
import 'package:localview/screens/seller/analyticsscreen.dart';
import 'package:localview/screens/seller/bussinesmanagment/businesmanagment.dart';
import 'package:localview/screens/seller/bussinesmanagment/businessinformationupdate.dart';
import 'package:localview/screens/seller/bussinesmanagment/bussinescategoryscreen.dart';
import 'package:localview/screens/seller/bussinesmanagment/bussineshours.dart';
import 'package:localview/screens/seller/bussinesmanagment/customersupport.dart';
import 'package:localview/screens/seller/bussinesmanagment/socialmediaintegration.dart';
import 'package:localview/screens/seller/bussinessprofile/addadressmapscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/addadressscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/bussinesinformation.dart';
import 'package:localview/screens/seller/bussinessprofile/createbusinessprofile.dart';
import 'package:localview/screens/seller/bussinessprofile/reviewmangment.dart';
import 'package:localview/screens/seller/bussinessprofile/updateuploadbusinesscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/uploadbussinesscreen.dart';
import 'package:localview/screens/seller/bussinessprofile/verificationdocument.dart';
import 'package:localview/screens/seller/createspecialoffer.dart';
import 'package:localview/screens/seller/dashboard.dart';
import 'package:localview/screens/seller/generatecodescreen.dart';
import 'package:localview/screens/seller/inappmessaging.dart';
import 'package:localview/screens/seller/messaging/chatdetailscreen.dart';
import 'package:localview/screens/seller/messaging/customerinteraction.dart';
import 'package:localview/screens/seller/paymentmanagment.dart';
import 'package:localview/screens/seller/productmanagment/productscreen.dart';
import 'package:localview/screens/seller/promocode.dart';
import 'package:localview/screens/seller/promotionsandoffer.dart';
import 'package:localview/screens/seller/pushnotificationscreen.dart';
import 'package:localview/screens/seller/securitysettingscreen.dart';
import 'package:localview/screens/seller/sellerblogs/addnewblogscreen.dart';
import 'package:localview/screens/seller/sellerblogs/sellerblogsnewsdetailscreen.dart';
import 'package:localview/screens/seller/sellerblogs/sellerblogsscreen.dart';
import 'package:localview/screens/seller/sellercreatebusiness/sellercreatebusinessstepper.dart';
import 'package:localview/screens/seller/setting/sellernotificationsettingscreen.dart';
import 'package:localview/screens/seller/setting/sellersettingscreen.dart';
import 'package:localview/screens/seller/subscription/subscriptionplan.dart';
import 'package:localview/screens/seller/transactiondetails.dart';
import 'package:localview/screens/setupprofile/addAddressfieldsscreen.dart';
import 'package:localview/screens/setupprofile/setupprofilescreen.dart';

class RouteManagment {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: RouteConstants.loginscreen,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: RouteConstants.onboardingscreen,
        page: () => OnboardingScreen(),
      ),
      GetPage(
        name: RouteConstants.splashscreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: RouteConstants.forgotemailverification,
        page: () => const ForgotEmailVerification(),
      ),
      GetPage(
        name: RouteConstants.signupscreen,
        page: () => SignupScreen(),
      ),
      GetPage(
        name: RouteConstants.forgotpassword,
        page: () => ForgotPassword(),
      ),
      GetPage(
        name: RouteConstants.resetpassword,
        page: () => ResetPassword(),
      ),
      GetPage(
        name: RouteConstants.setupprofilescreen,
        page: () => SetupProfileScreen(),
      ),
      GetPage(
        name: RouteConstants.addaddressfieldsScreen,
        page: () => AddAddressFieldsScreen(),
      ),
      GetPage(
        name: RouteConstants.homescreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: RouteConstants.homesearchscreen,
        page: () => const HomeSearchScreen(),
      ),
      GetPage(
        name: RouteConstants.reservationscreen,
        page: () => const ReservationScreen(),
      ),
      GetPage(
        name: RouteConstants.favouritesScreen,
        page: () => const FavoritesScreen(),
      ),
      GetPage(
        name: RouteConstants.savedScreen,
        page: () => const SavedScreen(),
      ),
      GetPage(
        name: RouteConstants.bookingreservationscreen,
        page: () => const BookingsReservationScreen(),
      ),
      GetPage(
        name: RouteConstants.notificationscreen,
        page: () => const NotificationsScreen(),
      ),
      GetPage(
        name: RouteConstants.settingscreen,
        page: () => const SettingScreen(),
      ),
      GetPage(
        name: RouteConstants.blogsnewscreen,
        page: () => const BlogsNewsScreen(),
      ),
      GetPage(
        name: RouteConstants.blogsnewdetailsscreen,
        page: () => const BlogsNewsDetailsScreen(),
      ),
      GetPage(
        name: RouteConstants.sendfeedbackscreen,
        page: () => const SendFeedbackScreen(),
      ),
      GetPage(
        name: RouteConstants.filterscreen,
        page: () => const FilterScreen(),
      ),
      GetPage(
        name: RouteConstants.myprofilescreen,
        page: () => const MyProfileScreen(),
      ),
      GetPage(
        name: RouteConstants.notificationsettingscreen,
        page: () => const NotificationsSettingScreen(),
      ),
      GetPage(
        name: RouteConstants.inappchangepasswordscreen,
        page: () => const InAppChangePasswordScreen(),
      ),
      GetPage(
        name: RouteConstants.helpsupportscreen,
        page: () => const HelpSupportScreen(),
      ),
      GetPage(
        name: RouteConstants.getaquotescreen,
        page: () => const GetAQuoteScreen(),
      ),
      GetPage(
        name: RouteConstants.aboutusscreen,
        page: () => const AboutUSScreen(),
      ),
      GetPage(
        name: RouteConstants.faqsscreen,
        page: () => const FAQsScreen(),
      ),
      GetPage(
        name: RouteConstants.faqsdetailscreen,
        page: () => const FAQsDetailScreen(),
      ),
      GetPage(
        name: RouteConstants.addressesscreen,
        page: () => const AddressesScreen(),
      ),
      GetPage(
        name: RouteConstants.addressesmapscreen,
        page: () => const AddAddressMapScreen(),
      ),

      ////////////////seller
      GetPage(
        name: RouteConstants.transactiondetails,
        page: () => TransactionDetailsScreen(),
      ),
      GetPage(
        name: RouteConstants.chatdetails,
        page: () => ChatsRoomDetails(),
      ),
      GetPage(
        name: RouteConstants.customerinteraction,
        page: () => CustomerInteractionScreen(),
      ),
      GetPage(
        name: RouteConstants.subscriptionscreen,
        page: () => SubscriptionScreen(),
      ),
      GetPage(
        name: RouteConstants.securityscreen,
        page: () => SecurityScreen(),
      ),
      GetPage(
        name: RouteConstants.paymentmethod,
        page: () => PaymentMangmentScreen(),
      ),

      GetPage(
        name: RouteConstants.generatecodes,
        page: () => GeneratePromoCodeScreen(),
      ),
      GetPage(
        name: RouteConstants.pushnotificaitonscreen,
        page: () => PushNotificationScreen(),
      ),
      GetPage(
        name: RouteConstants.inappmessaging,
        page: () => InAppMessagingScreen(),
      ),

      GetPage(
        name: RouteConstants.businessmanagment,
        page: () => BusinessManagment(),
      ),
      GetPage(
        name: RouteConstants.createproduct,
        page: () => CreatProduct(),
      ),
      GetPage(
        name: RouteConstants.selectyourbusiness,
        page: () => Selectyourbusiness(),
      ),
      GetPage(
        name: RouteConstants.businesscategory,
        page: () => BusinessCategoryScreen(),
      ),
      GetPage(
        name: RouteConstants.bussinesshours,
        page: () => BusinessHoursScreen(),
      ),
      GetPage(
        name: RouteConstants.socialmediascreen,
        page: () => SocialMediaScreen(),
      ),
      GetPage(
        name: RouteConstants.businessiupdatinformation,
        page: () => BusinessUpdateInformation(),
      ),
      GetPage(
        name: RouteConstants.updatebrandingmedia,
        page: () => UpdateBrandingMedia(),
      ),
      GetPage(
        name: RouteConstants.anyliticsscreen,
        page: () => AnalyticsScreen(),
      ),
      GetPage(
        name: RouteConstants.advertistingscreen,
        page: () => AdvertisitngScreen(),
      ),

      GetPage(
        name: RouteConstants.verifydocuments,
        page: () => VerifyDocumentsScreen(),
      ),

      GetPage(
        name: RouteConstants.reviewscreen,
        page: () => const ReviewManagmentScreen(),
      ),
      GetPage(
        name: RouteConstants.reviewscreen,
        page: () => const ReviewManagmentScreen(),
      ),
      GetPage(
        name: RouteConstants.addadresscreen,
        page: () => const AddAddressScreem(),
      ),
      // create special offer
      GetPage(
        name: RouteConstants.createoffer,
        page: () => CreateSepecialOfferScreen(),
      ),
      GetPage(
        name: RouteConstants.promocode,
        page: () => PromoCodeScreen(),
      ),
      GetPage(
        name: RouteConstants.promotionsandoffer,
        page: () => const PromotionsAndOffer(),
      ),
      GetPage(
        name: RouteConstants.dashboardscreen,
        page: () => const Dashboard(),
      ),
      GetPage(
        name: RouteConstants.addadressmapscreen,
        page: () => const AddAddressMapScreem(),
      ),
      GetPage(
        name: RouteConstants.customersupport,
        page: () => const CustomerSupportScreen(),
      ),
      GetPage(
        name: RouteConstants.uploadingbussiness,
        page: () => const UploadbusinesScreen(),
      ),
      GetPage(
        name: RouteConstants.bussinessinformation,
        page: () => const BusinessInformation(),
      ),

      GetPage(
        name: RouteConstants.sellersettingscreen,
        page: () => const SellerSettingScreen(),
      ),
      GetPage(
        name: RouteConstants.sellernotificationsettingscreen,
        page: () => const SellerNotificationsSettingScreen(),
      ),
      GetPage(
        name: RouteConstants.sellercreatebusinesstepper,
        page: () => const SellerCreateBusinessStepper(),
      ),
      GetPage(
        name: RouteConstants.sellerblogsnewscreen,
        page: () => const SelllerBlogsNewsScreen(),
      ),
      GetPage(
        name: RouteConstants.sellerblognewdetailscreen,
        page: () => const SellerBlogsNewsDetailsScreen(),
      ),
      GetPage(
        name: RouteConstants.userchatlistscreen,
        page: () => const UserChatListScreen(),
      ),
      GetPage(
        name: RouteConstants.userchatdetailscreen,
        page: () => const UserChatDetailScreen(),
      ),
      GetPage(
        name: RouteConstants.addnewblogscreen,
        page: () => const AddNewBlogScreen(),
      ),
    ];
  }
}
