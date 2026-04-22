import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;

  const ClickableText({
    super.key,
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
