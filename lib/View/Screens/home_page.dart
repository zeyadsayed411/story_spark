import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/View/Widgets/text_box_style.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import '../Widgets/clickable_photo.dart';
import '../Widgets/custom_image_widget.dart';
import '../Widgets/image_with_button.dart';
import '../Widgets/write_text_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: TextBoxtStyle(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: WriteTextBox(
                    hintText: "Search for a magical world..",
                    icon: Icons.search,
                    iconColor: Colors.grey,
                    textColor: Colors.grey,
                    fontSize: 20,
                    iconSize: 27,
                    containerColor: Colors.white10,
                    containerHeight: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: TextBoxtStyle(
                    text: "Discoverd theme",
                    textSize: 25,
                    textColor: AppColors.black,
                    textStyle: FontWeight.bold,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ClickablePhoto(
                        imagePath: "assets/images/Adventure_Button.png",
                        onTap: () {},
                        size: 110,
                      ),
                      ClickablePhoto(
                        imagePath: "assets/images/Animals_Button.png",
                        onTap: () {},
                        size: 110,
                      ),
                      ClickablePhoto(
                        imagePath: "assets/images/Fantasy_Button.png",
                        onTap: () {},
                        size: 110,
                      ),
                      ClickablePhoto(
                        imagePath: "assets/images/Education_Button.png",
                        onTap: () {},
                        size: 110,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                ImageWithButton(
                  imagePath: "assets/images/Story_Poster.png",
                  buttonText: "Begin story",
                  onPressed: () {},
                  height: 300,
                  width: 320,
                  textSize: 20,
                ),
                TextBoxtStyle(
                  text: "Story of the week",
                  textSize: 25,
                  textColor: AppColors.black,
                  textStyle: FontWeight.bold,
                ),
                SizedBox(height: 20.h),
                ImageWithButton(
                  imagePath: "assets/images/dragon_story.png",
                  buttonText: "Begin story",
                  onPressed: () {},
                  height: 300,
                  width: 320,
                  buttonGradient: AppColors.redPinkGradient,
                  textSize: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: TextBoxtStyle(
                    text: "The Dragon's Tea Party",
                    textSize: 20,
                    textColor: AppColors.black,
                    textStyle: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: TextBoxtStyle(
                    text: "By Oliver Oak",
                    textSize: 15,
                    textColor: AppColors.black,
                    textStyle: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                ImageWithButton(
                  imagePath: "assets/images/Midnight in the Library_story.png",
                  buttonText: "Begin story",
                  onPressed: () {},
                  height: 300,
                  width: 320,
                  buttonGradient: AppColors.redPinkGradient,
                  textSize: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: TextBoxtStyle(
                    text: "Midnight in the library",
                    textSize: 20,
                    textColor: AppColors.black,
                    textStyle: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: TextBoxtStyle(
                    text: "By Sarah SpellWeaver",
                    textSize: 15,
                    textColor: AppColors.black,
                    textStyle: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
