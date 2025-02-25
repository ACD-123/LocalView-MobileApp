import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localview/customwidgets/custompickimages.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/models/getprofiledatamodel.dart';
import 'package:localview/repository/authenticationrepo.dart';
import 'package:localview/screens/setupprofile/addaddressscreen.dart';
import 'package:localview/screens/setupprofile/setuppersonalinfoscreen.dart';
import 'package:localview/screens/setupprofile/setupuploadprofilescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  AuthRepo authRepo;

  final isLoading = false.obs;

  bool isEmailSelected = true;

  AuthenticationController({
    required this.authRepo,
  });

  final RxBool loginpasswordvisible = false.obs;
  void loginPasswordVisibility() {
    loginpasswordvisible.value = !loginpasswordvisible.value;
  }

//////////login api
////////remeber me logic
  RxBool remembermeischecked = false.obs;
  ////////saveremebe data
  saveremembermecredentials(
      {required String email,
      required String password,
      required bool isremeberme}) {
    // LocalStorage().setString("rememberemail", email);
    // LocalStorage().setString("rememberpasswrod", password);
    // LocalStorage().setBool("isrememberme", isremeberme);
  }

  ///clear remeber me data
  clearremebermecredentials() {
    // LocalStorage().remove("rememberemail");
    // LocalStorage().remove("rememberpasswrod");
    // LocalStorage().remove("isrememberme");
  }

  final RxBool registerPasswordVisible = false.obs;
  final RxBool registerConfirmPasswordVisible = false.obs;
  final changepasswordcontroller = TextEditingController().obs;
  final changeconfpasswordcontroller = TextEditingController().obs;
  void toggleRegisterPasswordVisibility() {
    registerPasswordVisible.value = !registerPasswordVisible.value;
  }

  void toggleRegisterConfirmPasswordVisibility() {
    registerConfirmPasswordVisible.value =
        !registerConfirmPasswordVisible.value;
  }

  final isObsCure = true.obs;

//////////setup upload profile image
  var setupuploadprofileimage = Rx<File?>(null);
  pickSetupUploadProfileImage(BuildContext context) async {
    final File? pickedImage = await customPickImage(context);
    if (pickedImage != null) {
      setupuploadprofileimage(File(pickedImage.path));
    }
  }

////////////setup profile stepper
  final PageController pageController = PageController();
  RxInt setupprofilecurrentPage = 0.obs;
  final setupProfilepages = [
    const SetupUploadProfileScreen(),
    const SetupPersonalInfoScreen(),
    const AddAddressScreen()
  ];

  void setupprofilegoToNextPage() {
    if (setupprofilecurrentPage < setupProfilepages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed(RouteConstants.homescreen);
    }
  }

/////////add address type
  final RxString addAddresstype = ''.obs;
  updateAddAddressType(String type) {
    addAddresstype.value = type;
  }

///////home categories list
  final RxList<Map<String, dynamic>> homecategorieslist = [
    {
      "name": "Food",
      "image": "assets/images/foodimage.png",
    },
    {
      "name": "Restaurants",
      "image": "assets/images/restaurantimage.png",
    },
    {
      "name": "Airports",
      "image": "assets/images/airportimage.png",
    },
    {
      "name": "Food",
      "image": "assets/images/foodimage.png",
    },
    {
      "name": "Restaurants",
      "image": "assets/images/restaurantimage.png",
    },
    {
      "name": "Airports",
      "image": "assets/images/airportimage.png",
    }
  ].obs;

////////////search history list
  final RxList<Map<String, dynamic>> searchistorylist = [
    {
      "title": "",
      "subtitle": "Restaurants",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
    {
      "title": "Le Château de Luxe",
      "subtitle": "1234 Maple Street, Apt. 56 Springfield, IL 62704 USA",
    },
  ].obs;

//////////restaurant images
  final RxList<Map<String, dynamic>> restaurantdetailimageslist = [
    {
      "image": "assets/images/restaurantdetailimage1.png",
    },
    {
      "image": "assets/images/restaurantdetailimage2.png",
    },
    {
      "image": "assets/images/restaurantdetailimage1.png",
    },
    {
      "image": "assets/images/restaurantdetailimage2.png",
    },
  ].obs;

////////////restaurant detail tabs list
  final RxList<String> restaurantdetailtabslist = [
    "Overview",
    "About",
    "Menu",
    "Discount",
    "Review",
  ].obs;

//////restaurant selected tab
  final RxInt restaurantselectedtab = 0.obs;
  updaterestaurantselectedtab(int index) {
    restaurantselectedtab.value = index;
  }

  final RxList<Map<String, dynamic>> favouriteslist = [
    {
      "title": "Los Angeles International Airport",
      "subtitle": "International Airport",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "distance",
      "distance": "Distance (9 mint)"
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
      "subtitle": "International Airport",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "distance",
      "distance": "Distance (9 mint)"
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
      "subtitle": "International Airport",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "distance",
      "distance": "Distance (9 mint)"
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
      "subtitle": "International Airport",
      "image": "assets/images/favimage1.png",
      "rating": 4,
      "ratingcount": "3.8",
      "type": "distance",
      "distance": "Distance (9 mint)"
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

//////////categories list
  final RxList<Map<String, dynamic>> favcategorieslist = [
    {
      "name": "All",
      "image": "",
    },
    {
      "name": "Food",
      "image": "assets/images/foodimage.png",
    },
    {
      "name": "Restaurants",
      "image": "assets/images/restaurantimage.png",
    },
    {
      "name": "Airports",
      "image": "assets/images/airportimage.png",
    },
    {
      "name": "Food",
      "image": "assets/images/foodimage.png",
    },
    {
      "name": "Restaurants",
      "image": "assets/images/restaurantimage.png",
    },
    {
      "name": "Airports",
      "image": "assets/images/airportimage.png",
    }
  ].obs;

/////////fav selected category
  final RxInt favselectedcategory = 0.obs;

///////reset password visibility
  final RxBool resetnewConfirmPasswordVisible = false.obs;
  final RxBool resetnewPasswordVisible = false.obs;
  void toggleResetNewPasswordVisibility() {
    resetnewPasswordVisible.value = !resetnewPasswordVisible.value;
  }

  void toggleResetNewConfirmPasswordVisibility() {
    resetnewConfirmPasswordVisible.value =
        !resetnewConfirmPasswordVisible.value;
  }

////////////////in app change password
  final RxBool inAppChangeCurrentPasswordVisible = false.obs;
  void toggleinAppChangeCurrentPasswordVisibility() {
    inAppChangeCurrentPasswordVisible.value =
        !inAppChangeCurrentPasswordVisible.value;
  }

  final RxBool inAppChangeNewPasswordVisible = false.obs;
  void toggleinAppChangeNewPasswordVisibility() {
    inAppChangeNewPasswordVisible.value = !inAppChangeNewPasswordVisible.value;
  }

  final RxBool inAppChangeConfirmPasswordVisible = false.obs;
  void toggleinAppChangeConfirmPasswordVisibility() {
    inAppChangeConfirmPasswordVisible.value =
        !inAppChangeConfirmPasswordVisible.value;
  }

///////////register
  final RxBool registerloading = false.obs;
  final registerFirstNameController = TextEditingController().obs;
  final registerLastNameController = TextEditingController().obs;
  final registerEmailController = TextEditingController().obs;
  final registerPasswordController = TextEditingController().obs;
  final registerPhoneNumberController = TextEditingController().obs;

  Future<void> register() async {
    try {
      registerloading.value = true;
      await authRepo.register(
        firstname: registerFirstNameController.value.text,
        lastname: registerLastNameController.value.text,
        email: registerEmailController.value.text,
        password: registerPasswordController.value.text,
        phonenumber: registerPhoneNumberController.value.text,
      );

      registerloading.value = false;
    } finally {
      registerloading.value = false;
    }
  }

//////////login
  final loginemailcontroller = TextEditingController().obs;
  final loginpasswordcontroller = TextEditingController().obs;
  final RxBool loginloading = false.obs;
  Future<void> login() async {
    try {
      loginloading.value = true;
      await authRepo.login(
        email: loginemailcontroller.value.text.toString(),
        password: loginpasswordcontroller.value.text.toString(),
      );

      loginloading.value = false;
    } catch (e) {
      loginloading.value = false;
    }
  }

////////////verify otp
  final RxString emailverifyOTP = ''.obs;
  final RxBool emailverifyOTPloading = false.obs;
  Future<void> verifyOTP({
    required String type,
    required String email,
  }) async {
    try {
      emailverifyOTPloading.value = true;
      await authRepo.verifyOTP(
          email: email, otp: emailverifyOTP.toString(), type: type);

      emailverifyOTPloading.value = false;
    } catch (e) {
      emailverifyOTPloading.value = false;
    }
  }

//////////send otp
  final RxBool sendOTPloading = false.obs;
  final sendOTPemailcontroller = TextEditingController().obs;
  Future<void> sendOTP({
    required String type,
    required String email,
    required String navigatetype,
  }) async {
    try {
      sendOTPloading.value = true;
      await authRepo.sendOTP(
          email: email, type: type, navigatetype: navigatetype);

      sendOTPloading.value = false;
    } catch (e) {
      sendOTPloading.value = false;
    }
  }

//////reset password
  final RxBool resetPasswordloading = false.obs;
  final resetpasswordcontroller = TextEditingController().obs;
  final resetConfpasswordcontroller = TextEditingController().obs;
  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      resetPasswordloading.value = true;
      await authRepo.resetPassword(
        email: email,
        password: resetpasswordcontroller.value.text.toString(),
        newpassword: resetConfpasswordcontroller.value.text.toString(),
      );

      resetPasswordloading.value = false;
    } catch (e) {
      resetPasswordloading.value = false;
    }
  }

//////logout
  logout() async {
    Get.offAllNamed(RouteConstants.loginscreen);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('becomeaseller', false);
    prefs.remove('token');
  }

//////////get profile data
  final RxBool getProfileDataloading = false.obs;
  final Rx<GetProfileDatModel?> getprofiledata = Rx<GetProfileDatModel?>(null);
  Future<void> getProfileData() async {
    try {
      getProfileDataloading.value = true;
      await authRepo.getProfileData().then((value) {
        getprofiledata.value = value;
        getProfileDataloading.value = false;
        if (value != null) {
          updateprofileFirstNameController.value.text =
              value.data?.firstName.toString() ?? "";
          updateprofileLastNameController.value.text =
              value.data?.lastName.toString() ?? "";
          updateprofilePhoneController.value.text =
              value.data?.phoneNumber.toString() ?? "";
        }
      });
    } catch (e) {
      getProfileDataloading.value = false;
    }
  }

////////update profile data
  final RxBool updateProfileDataloading = false.obs;
  final updateprofileFirstNameController = TextEditingController().obs;
  final updateprofileLastNameController = TextEditingController().obs;
  final updateprofilePhoneController = TextEditingController().obs;
  var uploadupdateMyProfileimage = Rx<File?>(null);
  pickupdateMyProfileImage(BuildContext context) async {
    final File? pickedImage = await customPickImage(context);
    if (pickedImage != null) {
      uploadupdateMyProfileimage(File(pickedImage.path));
    }
  }

/////////update profile data
  Future<void> updateProfileData() async {
    try {
      updateProfileDataloading.value = true;
      await authRepo
          .updateMyProfileData(
              firstname: updateprofileFirstNameController.value.text,
              lastname: updateprofileLastNameController.value.text,
              phonenumber: updateprofilePhoneController.value.text,
              image: uploadupdateMyProfileimage.value)
          .then((value) {
        getProfileData();
        updateProfileDataloading.value = false;
      });
    } catch (e) {
      updateProfileDataloading.value = false;
    }
  }
}
