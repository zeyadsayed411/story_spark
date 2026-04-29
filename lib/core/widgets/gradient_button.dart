import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final LinearGradient buttonGradient;
  final double width;
  final double height;
  final double fontSize;
  final Icon? icon;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonGradient,
    required this.width,
    required this.height,
    required this.fontSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: buttonGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize.sp,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  icon!,
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
