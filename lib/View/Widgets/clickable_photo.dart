import 'package:flutter/material.dart';

class ClickablePhoto extends StatelessWidget {
  final String imagePath;       // asset path
  final double size;            // size of the icon
  final VoidCallback onTap;     // action when clicked

  const ClickablePhoto({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.size // default size
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
      ),
    );
  }
}
