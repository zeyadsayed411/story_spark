import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithButton extends StatelessWidget {
  final String imagePath; // Asset image only
  final String buttonText; // button label
  final VoidCallback onPressed; // button action
  final double height;
  final double width;
  final Gradient? buttonGradient; // optional gradient
  final Color? buttonColor; // optional solid color
  final double textSize; // optional text size

  const ImageWithButton({
    Key? key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
    required this.height,
    required this.width,
    this.buttonGradient,
    this.buttonColor,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Align(
        alignment: AlignmentGeometry.bottomLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: buttonGradient,
            color: buttonColor,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: textSize.sp,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
