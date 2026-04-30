import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBoxStyle extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? textStyle;
  final Color textColor;

  const TextBoxStyle({
    super.key,
    required this.text,
    required this.textSize,
    required this.textColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: textSize.sp,
        fontWeight: textStyle,
        color: textColor,
      ),
    );
  }
}
