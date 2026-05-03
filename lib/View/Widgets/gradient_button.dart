import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final LinearGradient buttonGradient;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonGradient,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.textColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    // default text size
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: buttonGradient,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize.sp,
                  ),
                ),
                const SizedBox(width: 8),
                 Icon( icon , color: iconColor,size: iconSize,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
