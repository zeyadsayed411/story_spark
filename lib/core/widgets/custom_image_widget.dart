import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageWidget extends StatelessWidget {
  final String imagePath; // asset path
  final double height;
  final double width;
  final Color? color; // apply tint color

  const CustomImageWidget({
    super.key,
    required this.imagePath,
    this.color,
    required this.height,
    required this.width, // optional color tint
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width.w,
      height: height.h,
      color: color,
    );
  }
}
