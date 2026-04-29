import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/core/constants/app_assets.dart';
import 'package:story_spark/core/constants/route_names.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import 'package:story_spark/core/widgets/clickable_text.dart';
import 'package:story_spark/core/widgets/gradient_button.dart';
import 'package:story_spark/core/widgets/gradient_text_box_style.dart';
import 'package:story_spark/core/widgets/indicator_widget.dart';
import 'package:story_spark/core/widgets/text_box_style.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.signUp);
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, RouteNames.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildPage1(),
          _buildPage2(),
          _buildPage3(),
        ],
      ),
    );
  }

  Widget _buildPage1() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.pinkGradient),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Image.asset(AppAssets.characterIllustration),
              Column(
                children: [
                  TextBoxStyle(
                    text: "Welcome to the",
                    textSize: 38,
                    textColor: AppColors.darkPurple,
                    textStyle: FontWeight.bold,
                  ),
                  const GradientTextBoxStyle(
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
              const Spacer(),
              IndicatorWidget(currentIndex: 0),
              SizedBox(height: 30.h),
              GradientButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 22),
                text: "Next",
                onPressed: _nextPage,
                buttonGradient: AppColors.redPinkGradient,
                width: 250,
                height: 50,
                fontSize: 25,
              ),
              SizedBox(height: 20.h),
              ClickableText(
                text: "Skip Intro",
                onTap: _skip,
                textColor: AppColors.black,
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.yellowGradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset(AppAssets.storyIllustration),
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
              const Spacer(),
              IndicatorWidget(currentIndex: 1),
              SizedBox(height: 30.h),
              GradientButton(
                text: "Next",
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 22),
                onPressed: _nextPage,
                buttonGradient: AppColors.redPinkGradient,
                width: 250,
                height: 55,
                fontSize: 22,
              ),
              SizedBox(height: 20.h),
              ClickableText(
                text: "Skip",
                onTap: _skip,
                textColor: AppColors.black,
                fontSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage3() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(gradient: AppColors.pinkGradient),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset(AppAssets.mainIllustration),
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
              IndicatorWidget(currentIndex: 2),
              SizedBox(height: 30.h),
              GradientButton(
                text: "Get Started",
                icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 22),
                onPressed: _nextPage,
                buttonGradient: AppColors.redPinkGradient,
                width: 250,
                height: 55,
                fontSize: 22,
              ),
              SizedBox(height: 20.h),
              ClickableText(
                text: "BACK TO BEGIN",
                onTap: () {
                  _pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
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
    );
  }
}
