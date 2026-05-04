import 'package:flutter/material.dart';
import 'package:story_spark/core/themes/app_colors.dart';

class BottomNavigator extends StatefulWidget {
  final List<Widget> pages;

  const BottomNavigator({Key? key, required this.pages}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _GradientBottomNavState();
}

class _GradientBottomNavState extends State<BottomNavigator> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem(Icons.book, "HOME", 0),
          _buildNavItem(Icons.favorite, "MAGIC", 1),
          _buildNavItem(Icons.add, "CREATE", 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    final isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.redPinkGradient, // <-- your theme gradient
              ),
              child: Icon(icon, color: Colors.white),
            )
          : Icon(icon, color: Colors.grey),
      label: label,
    );
  }
}
