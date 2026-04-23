import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteTextBox extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color iconColor;
  final Color textColor;
  final Color containerColor;
  final double fontSize;
  final double iconSize;
  final double? containerWidth;
  final double? containerHeight;

  const WriteTextBox({
    super.key,
    required this.hintText,
    required this.icon,
    required this.iconColor,
    required this.textColor,
    required this.fontSize,
    required this.iconSize,
    this.containerWidth,
    this.containerHeight,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: containerWidth?.w,
        height: containerHeight?.h,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            Icon(icon, color: iconColor, size: iconSize),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: textColor.withOpacity(0.6),
                    fontSize: fontSize.sp,
                  ),
                  border: InputBorder.none, // removes underline
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
