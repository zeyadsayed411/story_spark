import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import 'package:story_spark/core/widgets/button.dart';
import 'package:story_spark/core/widgets/custom_image_widget.dart';
import 'package:story_spark/core/widgets/gradient_button.dart';
import 'package:story_spark/core/widgets/text_box_style.dart';
import 'package:story_spark/core/widgets/image_container.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: CustomImageWidget(
          imagePath: "assets/images/star.png",
          height: 40,
          width: 40,
        ),
        title: TextBoxStyle(
          text: "Magical tales",
          textSize: 25,
          textColor: AppColors.darkReddishPurple,
          textStyle: FontWeight.bold,
        ),
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        decoration: BoxDecoration(color: AppColors.softPink),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            size: 32,
                            color: AppColors.darkReddishPurple,
                          ),
                          SizedBox(width: 10.w),
                          TextBoxStyle(
                            text: "The Tale Begins",
                            textSize: 25,
                            textColor: AppColors.darkReddishPurple,
                            textStyle: FontWeight.bold,
                          ),
                        ],
                      ),
                      Button(
                        text: "Edit",
                        onPressed: () {},
                        buttonColor: AppColors.grey,
                        width: 108,
                        height: 20,
                        fontSize: 20,
                        textColor: AppColors.black,
                        icon: Icons.edit,
                        iconColor: AppColors.black,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                ImageContainer(
                  imagePath:
                      "assets/images/The Starbound Kingdom_story_story.png",
                  height: 380,
                  width: 350,
                ),
                SizedBox(height: 25.h),
                TextBoxStyle(
                  text:
                      "High above the silver clouds, where gravity is but a suggestion, lies the Starbound Kingdom. For centuries, the floating spires have hummed with a melody that keeps the universe in balance. But when the Great Crystal starts to dim, a young star-mapper named Orion must embark on a journey across the Nebula Sea to find the missing shards of light.",
                  textSize: 20,
                  textColor: AppColors.black,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientButton(
                      text: 'Next',
                      onPressed: () {},
                      buttonGradient: AppColors.redPinkGradient,
                      width: 110,
                      height: 30,
                      fontSize: 20,
                      textColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    GradientButton(
                      text: 'Back',
                      onPressed: () {},
                      buttonGradient: AppColors.redPinkGradient,
                      width: 110,
                      height: 30,
                      fontSize: 20,
                      textColor: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Button(
                  text: "Delete",
                  onPressed: () {},
                  buttonColor: AppColors.grey,
                  width: 130,
                  height: 40,
                  fontSize: 20,
                  textColor: AppColors.black,
                  icon: Icons.delete,
                  iconSize: 20,
                  iconColor: AppColors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
