import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndicatorWidget extends StatelessWidget {
  final int currentIndex;

  const IndicatorWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: _buildDot(isActive: index == currentIndex),
        );
      }),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8.h,
      width: isActive ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFE91E63)
            : Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
