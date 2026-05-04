import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/View/Widgets/button.dart';
import 'package:story_spark/View/Widgets/gradient_button.dart';
import 'package:story_spark/View/Widgets/upload_story_cover.dart';
import 'package:story_spark/View/Widgets/write_text_box.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import '../Widgets/custom_image_widget.dart';
import '../Widgets/text_box_style.dart';

class CreateStoryScreen extends StatefulWidget {
  const CreateStoryScreen({super.key});

  @override
  State<CreateStoryScreen> createState() => _CreateStoryScreemState();
}

class _CreateStoryScreemState extends State<CreateStoryScreen> {
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                TextBoxtStyle(
                  text: "Create New Magic",
                  textSize: 30,
                  textColor: AppColors.darkReddishPurple,
                  textStyle: FontWeight.bold,
                ),
                TextBoxtStyle(
                  text: "Every great adventure begins with a",
                  textSize: 18,
                  textColor: AppColors.black,
                ),
                TextBoxtStyle(
                  text: "single word.",
                  textSize: 18,
                  textColor: AppColors.black,
                ),
                SizedBox(height: 20.h),
                UploadStoryCover(
                  height: 250,
                  width: 350,
                  onUpload: () {},
                  defaultImagePath: 'assets/images/upload default photo.png',
                ),
                SizedBox(height: 20.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 2,
                      ),
                      child: TextBoxtStyle(
                        text: "STORY TITLE",
                        textSize: 16,
                        textColor: AppColors.darkReddishPurple,
                        textStyle: FontWeight.bold,
                      ),
                    ),
                    WriteTextBox(
                      hintText: "Tell Us About Your Magic..",
                      textColor: AppColors.grey,
                      fontSize: 20,
                      containerColor: AppColors.greyWhite,
                      containerHeight: 48,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 2,
                      ),
                      child: TextBoxtStyle(
                        text: "Chapter Title",
                        textSize: 16,
                        textColor: AppColors.darkReddishPurple,
                        textStyle: FontWeight.bold,
                      ),
                    ),
                    WriteTextBox(
                      hintText: "Tell Us Your Magic..",
                      textColor: AppColors.grey,
                      fontSize: 20,
                      containerColor: AppColors.greyWhite,
                      containerHeight: 400,
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Button(
                  icon: Icons.add_box_outlined,
                  iconColor: AppColors.black,
                  iconSize: 22,
                  text: "Add Chapter",
                  onPressed: () {},
                  buttonColor: AppColors.grey,
                  width: 350,
                  height: 55,
                  fontSize: 20,
                  textColor: AppColors.black,
                ),
                SizedBox(height: 15.h),
                GradientButton(
                  text: "",
                  onPressed: () {},
                  buttonGradient: AppColors.redPinkGradient,
                  width: 350,
                  height: 55,
                  fontSize: 20,
                  textColor: Colors.white,
                  icon: Icons.save_alt,
                  iconColor: Colors.white,
                  iconSize: 20,
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
