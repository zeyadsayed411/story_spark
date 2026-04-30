import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/core/themes/app_colors.dart';
import 'package:story_spark/core/constants/route_names.dart';
import 'package:story_spark/core/widgets/clickable_photo.dart';
import 'package:story_spark/core/widgets/custom_image_widget.dart';
import 'package:story_spark/core/widgets/image_with_button.dart';
import 'package:story_spark/core/widgets/text_box_style.dart';
import 'package:story_spark/core/widgets/write_text_box.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                TextBoxStyle(
                  text: "Discoverd theme",
                  textSize: 25,
                  textColor: AppColors.black,
                  textStyle: FontWeight.bold,
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
                SizedBox(height: 10.h,),
                TextBoxStyle(
                  text: "Story of the week",
                  textSize: 25,
                  textColor: AppColors.black,
                  textStyle: FontWeight.bold,
                ),
                ImageWithButton(
                  imagePath: "assets/images/Story_Poster.png",
                  buttonText: "Begin story",
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.createStory);
                  },
                  height: 400,
                  width: 400,
                  buttonGradient: AppColors.redPinkGradient, textSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
