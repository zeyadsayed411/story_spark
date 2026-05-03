import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath; // Asset image only
  final double height;
  final double width;
  final double borderRadius;

  const ImageContainer({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.borderRadius = 50, // default radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
