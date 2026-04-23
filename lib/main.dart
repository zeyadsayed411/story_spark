import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen1.dart.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen3.dart.dart';
import 'package:story_spark/View/Screens/hero_screen.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: child,

          routes: {
            OnboardingScreen1.routeName: (context) => const OnboardingScreen1(),
            OnboardingScreen2.routeName: (context) => const OnboardingScreen2(),

            OnboardingScreen3.routeName: (context) => const OnboardingScreen3(),

            HeroScreen.routeName: (context) => const HeroScreen(),
          },
        );
      },

      child: const OnboardingScreen1(),
    );
  }
}
