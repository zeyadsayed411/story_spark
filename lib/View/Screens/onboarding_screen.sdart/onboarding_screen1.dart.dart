import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/Themes/app_colors.dart';
import 'package:story_spark/View/Screens/hero_screen.dart';
import 'package:story_spark/View/Widgets/clickable_text.dart';
import 'package:story_spark/View/Widgets/gradient_button.dart';
import 'package:story_spark/View/Widgets/gradient_text_box_style.dart';
import 'package:story_spark/View/Widgets/indicator_widget.dart';
import '../../Widgets/text_box_style.dart';
import 'package:story_spark/View/Screens/onboarding_screen.sdart/onboarding_screen2.dart';

class OnboardingScreen1 extends StatefulWidget {
  static const String routeName = "onboarding_screen1";

  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.pinkGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 55),
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  "assets/images/Character Illustration with Overlapping Depth_margin.png",
                ),
              ),
              Column(
                children: [
                  TextBoxtStyle(
                    text: "Welcome to the",
                    textSize: 38,
                    textColor: AppColors.darkPurble,
                    textStyle: FontWeight.bold,
                  ),
                  GradientTextBoxStyle(
                    text: "magical kids",
                    textSize: 35,
                    textStyle: FontWeight.bold,
                    textGradient: AppColors.purbleBlueGradient,
                  ),
                  TextBoxtStyle(
                    text: "story world",
                    textSize: 34,
                    textColor: AppColors.darkPurble,
                    textStyle: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  TextBoxtStyle(
                    text: "Where every dream becomes a",
                    textSize: 19.5,
                    textColor: AppColors.black,
                  ),
                  TextBoxtStyle(
                    text: "story and every child is a hero",
                    textSize: 21,
                    textColor: AppColors.black,
                  ),
                ],
              ),
              Spacer(),
              IndicatorWidget(currentIndex: 0),
              SizedBox(height: 30.h),

              GradientButton(
                text: "Next",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen2(),
                    ),
                  );
                },
                buttonGradient: AppColors.redPinkGradient,
                width: 250,
                height: 50,
                fontSize: 25,
              ),
              SizedBox(height: 20.h),
              ClickableText(
                text: "Skip Intro",
                onTap: () {
                  Navigator.pushReplacementNamed(context, HeroScreen.routeName);
                },
                textColor: AppColors.black,
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
