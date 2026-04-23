import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/Themes/app_colors.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen1.dart.dart';
import 'package:story_spark/View/Widgets/clickable_text.dart';
import 'package:story_spark/View/Widgets/gradient_button.dart';
import 'package:story_spark/View/Widgets/indicator_widget.dart';
import 'package:story_spark/View/Screens/hero_screen.dart';

class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  static const String routeName = "/onboarding_screen3";

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  bool show = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.pinkGradient),
        child: SafeArea(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: show ? 1 : 0,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 800),
              offset: show ? Offset.zero : const Offset(0, 0.1),
              curve: Curves.easeOut,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    Image.asset("assets/images/Main Illustration Card.png"),

                    SizedBox(height: 50.h),

                    Text(
                      "Read, create, and save your own magical stories",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    SizedBox(height: 15.h),

                    Text(
                      "Share your own magical stories with the world.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),

                    const Spacer(),

                    const IndicatorWidget(currentIndex: 2),
                    SizedBox(height: 30.h),

                    GradientButton(
                      text: "Get Started",
                      onPressed: () {
                        Navigator.pushNamed(context, HeroScreen.routeName);
                      },
                      buttonGradient: AppColors.redPinkGradient,
                      width: 250,
                      height: 55,
                      fontSize: 22,
                    ),

                    SizedBox(height: 20.h),

                    ClickableText(
                      text: "BACK TO BEGIN",
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          OnboardingScreen1.routeName,
                        );
                      },
                      textColor: AppColors.black,
                      fontSize: 18,
                    ),

                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
