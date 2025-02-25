import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localview/constants/appcolors.dart';

Switch customSwitchButton({
  required RxBool value,
  required Function(bool) onChanged,
}) {
  return Switch(
    trackOutlineColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.maincolor;
        }
        return AppColors.white;
      },
    ),
    activeColor: AppColors.white,
    activeTrackColor: AppColors.maincolor,
    inactiveThumbColor: AppColors.white,
    inactiveTrackColor: AppColors.colorCCCA,
    value: value.value,
    onChanged: (newValue) {
      onChanged(newValue);
    },
  );
}
