import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/Themes/app_colors.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen3.dart.dart';
import 'package:story_spark/View/Widgets/clickable_text.dart';
import 'package:story_spark/View/Widgets/gradient_button.dart';
import 'package:story_spark/View/Widgets/indicator_widget.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  static String get routeName => "onboarding_screen2";

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  bool show = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
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
        decoration: BoxDecoration(gradient: AppColors.yellowGradient),
        child: SafeArea(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 800),
            opacity: show ? 1 : 0,
            child: AnimatedSlide(
              duration: Duration(milliseconds: 800),
              offset: show ? Offset.zero : Offset(0, 0.1),
              curve: Curves.easeOut,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),

                    Image.asset(
                      "assets/images/Story Illustration Area (Bento-style overlapping layout).png",
                    ),

                    SizedBox(height: 50.h),

                    Text(
                      "Discover fairy adventures and enchanted books",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    SizedBox(height: 15.h),

                    Text(
                      "Unlock a world where every page turn brings stories to life.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                    ),

                    Spacer(),

                    IndicatorWidget(currentIndex: 1),

                    SizedBox(height: 30.h),

                    GradientButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingScreen3(),
                          ),
                        );
                      },
                      buttonGradient: AppColors.redPinkGradient,
                      width: 250,
                      height: 55,
                      fontSize: 22,
                    ),

                    SizedBox(height: 20.h),

                    ClickableText(
                      text: "Skip",
                      onTap: () {},
                      textColor: AppColors.black,
                      fontSize: 18,
                    ),
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
