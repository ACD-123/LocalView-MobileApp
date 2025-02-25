// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localview/constants/appcolors.dart';
import 'package:localview/customwidgets/def.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.inputFormatter,
    required this.hintText,
    this.keyboardtype,
    required this.editingController,
    required this.validator,
    this.enabled = true,
    this.onChanged,
    this.onTap,
    this.height = 35.0,
    this.suffixIcon, // Add this line
  }) : super(key: key);

  final TextInputFormatter? inputFormatter;
  final String hintText;
  final TextEditingController editingController;
  final FieldValidator validator;
  final TextInputType? keyboardtype;
  final bool enabled;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final double height;

  final Widget? suffixIcon; // Add a nullable Widget for the suffixIcon

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      enabled: enabled,
      keyboardType: keyboardtype,
      controller: editingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        isDense: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: height / 3, horizontal: 18.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.greytheme, width: 1.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
        suffixIcon: suffixIcon, // Add the suffixIcon to the decoration
      ),
    );
  }
}
