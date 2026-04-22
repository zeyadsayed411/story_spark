import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientTextBoxStyle extends StatelessWidget {
  final String text;
  final int textSize;
  final FontWeight textStyle;
  final LinearGradient textGradient;

  const GradientTextBoxStyle({
    super.key,
    required this.text,
    required this.textSize,
    required this.textStyle,
    required this.textGradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => textGradient.createShader(bounds),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: textSize.sp,
          fontWeight: textStyle,
        ),
      ),
    );
  }
}
