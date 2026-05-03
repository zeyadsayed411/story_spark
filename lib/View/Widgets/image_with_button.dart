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
  final double textSize; // text size

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
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ).copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: buttonGradient ??
                  const LinearGradient(
                    colors: [Colors.pink, Colors.red],
                  ),
              color: buttonColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: textSize.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
