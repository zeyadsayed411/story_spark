import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBoxtStyle extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? textStyle;
  final Color textColor;

  const TextBoxtStyle({
    required this.text,
    required this.textSize,
    required this.textColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: textSize.sp,
          fontWeight: textStyle,
          color: textColor,
        ),
      ),
    );
  }
}
