import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/constants/fontfamily.dart';

Column customTextFormField({
  required String hinttext,
  String? fieldtitle,
  int? lines,
  bool? enabled,
  TextInputType? keyboardType,
  TextInputFormatter? inputFormatter,
  FormFieldValidator<String>? validator,
  TextEditingController? controller,
  VoidCallback? visibleiconontap,
  RxBool? passwordvisible,
  String? password,
  Widget? suffixIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      fieldtitle == null || fieldtitle.isEmpty
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.only(bottom: 4.h),
              child: Text(
                fieldtitle,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    fontFamily: FontFamily.helvetica,
                    color: AppColors.black),
              ),
            ),
      Align(
        alignment: Alignment.centerLeft,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          enabled: enabled,
          inputFormatters: inputFormatter != null ? [inputFormatter] : null,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: lines ?? 1,
          obscureText:
              password == "true" && (passwordvisible?.value ?? false) == false,
          style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontFamily.helvetica,
              color: AppColors.black),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              suffixIcon: password == "true"
                  ? GestureDetector(
                      onTap: visibleiconontap,
                      child: Icon(
                        passwordvisible?.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.maincolor,
                        size: 20.sp,
                      ),
                    )
                  : suffixIcon ?? null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      lines == null || lines == 0 ? 30.sp : 12.sp),
                  borderSide:
                      BorderSide(color: AppColors.color2E2E.withOpacity(0.2))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      lines == null || lines == 0 ? 30.sp : 12.sp),
                  borderSide:
                      BorderSide(color: AppColors.color2E2E.withOpacity(0.2))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      lines == null || lines == 0 ? 30.sp : 12.sp),
                  borderSide:
                      BorderSide(color: AppColors.color2E2E.withOpacity(0.2))),
              hintText: hinttext,
              hintStyle: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.helvetica,
                  color: AppColors.color9494)),
        ),
      ),
    ],
  );
}
