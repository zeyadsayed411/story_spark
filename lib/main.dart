import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:story_spark/View/Screens/create_story_screen.dart';
import 'package:story_spark/View/Screens/home_page.dart';
import 'package:story_spark/View/Screens/story_view.dart';
import 'package:story_spark/View/Widgets/bottom_navigator.dart';
import 'package:story_spark/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:story_spark/core/constants/route_names.dart';
import 'package:story_spark/features/auth/presentation/screens/login_screen.dart';
import 'package:story_spark/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:story_spark/features/onboarding/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          initialRoute: RouteNames.splash,
          routes: {
            RouteNames.splash: (context) => const SplashScreen(),
            RouteNames.onboarding: (context) => const OnboardingScreen(),
            RouteNames.signUp: (context) => const SignUpScreen(),
            RouteNames.login: (context) => const LoginScreen(),
            RouteNames.home: (context) => const BottomNavigator(
                  pages: [
                    HomePage(),
                    StoryView(),
                    CreateStoryScreen(),
                  ],
                ),
            RouteNames.createStory: (context) => const CreateStoryScreen(),
          },
        );
      },
    );
  }
}
