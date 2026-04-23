import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_spark/Themes/app_colors.dart';
import 'package:story_spark/View/Widgets/clickable_photo.dart';
import 'package:story_spark/View/Widgets/custom_image_widget.dart';
import 'package:story_spark/View/Widgets/text_box_style.dart';
import 'package:story_spark/View/Widgets/write_text_box.dart';

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
            TextBoxtStyle(
              text: "Discoverd theme",
              textSize: 30,
              textColor: AppColors.black,
              textStyle: FontWeight.bold,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClickablePhoto(
                    imagePath: "assets/images/Adventure_Button.png",
                    onTap: (){},
                    size: 110,
                  ),
                  ClickablePhoto(
                    imagePath: "assets/images/Animals_Button.png",
                    onTap: (){},
                    size: 110,
                  ),
                  ClickablePhoto(
                    imagePath: "assets/images/Fantasy_Button.png",
                    onTap: (){},
                    size: 110,
                  ),
                  ClickablePhoto(
                    imagePath: "assets/images/Education_Button.png",
                    onTap: (){},
                    size: 110,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
