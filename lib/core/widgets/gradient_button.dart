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
  final Icon? icon;
  final bool isLoading;

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
    this.isLoading = false,
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
          disabledBackgroundColor: Colors.transparent,
        ),
        onPressed: isLoading ? null : onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: isLoading
                ? LinearGradient(
                    colors: [Colors.grey.shade400, Colors.grey.shade400],
                  )
                : buttonGradient,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.h,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  )
                : Row(
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
                      if (icon != null) ...[const SizedBox(width: 8), icon!],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
