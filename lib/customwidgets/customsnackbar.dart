import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';

void customSuccessSnackBar({required String message}) {
  Get.snackbar("Success!", message,
      backgroundColor: AppColors.maincolor, colorText: AppColors.white);
}

void customErrorSnackBar({
  required String message,
}) {
  Get.snackbar("Error!", message,
      backgroundColor: AppColors.maincolor, colorText: AppColors.white);
}

void customSnackBar({required String message}) {
  Get.snackbar(message, "",
      backgroundColor: AppColors.maincolor, colorText: AppColors.white);
}

//////////to camel case
String toCamelCase(String? input) {
  if (input == null || input.trim().isEmpty || input.toLowerCase() == 'null')
    return '';

  return input
      .split(' ')
      .map((word) => word.isNotEmpty
          ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
          : '')
      .join(' ');
}
