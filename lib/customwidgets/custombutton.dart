import 'package:flutter/material.dart';
import 'package:localview/constants/appcolors.dart';

// ignore: must_be_immutable
class ElevetedButton extends StatelessWidget {
  ElevetedButton({
    Key? key,
    required this.buttonName,
    this.ontap,
    this.height = 50,
    this.width = double.maxFinite,
    this.fontSize = 18,
    this.color, // Single color
    this.gradientColors, // List of colors
    this.textColor = Colors.white, // Default text color
    this.borderColor, // Optional border color
    this.borderWidth = 0, // Optional border width (default to 0)
    this.suffixIcon, // Optional suffix icon
  }) : super(key: key);

  final String buttonName;
  final ontap;
  final double? height, width, fontSize;
  final Color? color; // Single color
  final List<Color>? gradientColors; // List of colors
  final Color textColor; // Text color
  final Color? borderColor; // Optional border color
  final double borderWidth; // Optional border width
  final Image? suffixIcon; // Optional suffix icon

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;

    if (color != null) {
      // Use a single color
      decoration = BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: borderColor ??
              Colors.transparent, // Use borderColor or default to transparent
          width: borderWidth,
        ),
      );
    } else if (gradientColors != null) {
      // Use gradient colors
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors!,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: borderColor ??
              Colors.transparent, // Use borderColor or default to transparent
          width: borderWidth,
        ),
      );
    } else {
      // Default gradient
      decoration = BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF8B2CA0), Color(0xFF00C3C9)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: borderColor ??
              Colors.transparent, // Use borderColor or default to transparent
          width: borderWidth,
        ),
      );
    }

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: decoration,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min, // Center the content of the Row
            children: [
              if (suffixIcon != null) ...[
                SizedBox(width: 8), // Space between text and icon
                suffixIcon!, // Display the suffix icon if provided
              ],
              SizedBox(
                width: 8,
              ),
              Text(
                buttonName,
                style: TextStyle(
                  color: textColor,
                  fontFamily: AppColors.helvetica,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
