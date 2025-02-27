import 'package:get/get.dart';
import 'package:localview/repository/authenticationrepo.dart';
import 'package:localview/repository/userbusinessrepo.dart';
import 'package:localview/repository/userprofilerepository.dart';
import 'package:localview/services/apiservices.dart';

Future<void> init() async {
  Get.lazyPut(() => HttpApiClient());
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserProfileRepository(apiClient: Get.find()));
  Get.lazyPut(() => UserBusinessRepository(apiClient: Get.find()));
}
