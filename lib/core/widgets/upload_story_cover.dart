import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/core/themes/app_colors.dart';

class UploadStoryCover extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onUpload;
  final String defaultImagePath; // asset path for default photo

  const UploadStoryCover({
    Key? key,
    required this.height,
    required this.width,
    required this.onUpload, required this.defaultImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(defaultImagePath), // ✅ default photo
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(55),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular ElevatedButton
          ElevatedButton(
            onPressed: onUpload,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.pink,
              shadowColor: Colors.transparent,
            ),
            child: const Icon(Icons.camera_alt, color: Colors.white , size: 32),
          ),
          const SizedBox(height: 12),
          const Text(
            "Upload Story Cover",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Max size 5MB (JPG, PNG)",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
