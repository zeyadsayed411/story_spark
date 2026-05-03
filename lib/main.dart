import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/View/Screens/create_story_screen.dart';
import 'package:story_spark/View/Screens/home_page.dart';
import 'package:story_spark/View/Widgets/bottom_navigator.dart';
import 'View/Screens/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X size (example)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavigator(
            pages: const [
              HomePage(),
              StoryView(),
              CreateStoryScreen(),
            ],
          ),
        );
      },
    );
  }
}
