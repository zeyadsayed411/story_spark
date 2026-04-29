import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final double width;
  final double height;
  final double fontSize;
  final Color textColor;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.textColor,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        fixedSize: Size(width.w, height.h),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize.sp,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, color: iconColor,size: iconSize,),
          ],
        ],
      ),
    );
  }
}
