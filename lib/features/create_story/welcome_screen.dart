import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import 'package:story_spark/core/widgets/clickable_text.dart';
import 'package:story_spark/core/widgets/gradient_button.dart';
import 'package:story_spark/core/widgets/gradient_text_box_style.dart';
import 'package:story_spark/core/widgets/text_box_style.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
                  TextBoxStyle(
                    text: "Welcome to the",
                    textSize: 38,
                    textColor: AppColors.darkPurple,
                    textStyle: FontWeight.bold,
                  ),
                  GradientTextBoxStyle(
                    text: "magical kids",
                    textSize: 35,
                    textStyle: FontWeight.bold,
                    textGradient: AppColors.purpleBlueGradient,
                  ),
                  TextBoxStyle(
                    text: "story world",
                    textSize: 34,
                    textColor: AppColors.darkPurple,
                    textStyle: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                children: [
                  TextBoxStyle(
                    text: "Where every dream becomes a",
                    textSize: 19.5,
                    textColor: AppColors.black,
                  ),
                  TextBoxStyle(
                    text: "story and every child is a hero",
                    textSize: 21,
                    textColor: AppColors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              GradientButton(
                text: "Next",
                onPressed: () {},
                buttonGradient: AppColors.redPinkGradient,
                width: 250,
                height: 50,
                fontSize: 25,
                textColor: Colors.white,
              ),
              SizedBox(height: 20.h),
              ClickableText(
                text: "Skip Intro",
                onTap: () {},
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
