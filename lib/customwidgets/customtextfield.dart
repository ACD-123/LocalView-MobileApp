import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/def.dart';

class PasswordtextFieldPassword extends StatelessWidget {
  PasswordtextFieldPassword({
    Key? key,
    this.inputFormatter,
    required this.fieldValidator,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.hiddenPassword = true,
    this.callback,
    this.height = 35.0,
  }) : super(key: key);

  final String hintText;
  final FieldValidator fieldValidator;
  final TextEditingController controller;
  final bool hiddenPassword;
  final TextInputType? keyboardType;
  final TextInputFormatter? inputFormatter;
  final Function()? callback;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: hiddenPassword,
      controller: controller,
      validator: fieldValidator,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: height / 3, horizontal: 18.0), // Adjusted height here
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
        suffixIcon: InkWell(
          onTap: callback, // Call the toggle function
          child: Icon(
            hiddenPassword ? Icons.visibility_off : Icons.visibility,
            size: 20,
            color: AppColors.lineargradient1,
          ),
        ),
      ),
    );
  }
}
