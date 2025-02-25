import 'package:get/get.dart';
import 'package:localview/repository/authenticationrepo.dart';
import 'package:localview/services/apiservices.dart';

Future<void> init() async {
  Get.lazyPut(() => HttpApiClient());
  Get.lazyPut(() => AuthRepo(apiClient: Get.find()));
}
