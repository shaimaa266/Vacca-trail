
import 'package:app_vacca/features/Ui/activity_system/page_one.dart';
import 'package:app_vacca/features/Ui/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/Ui/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/Ui/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/Ui/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreedingSystems extends StatelessWidget {
  BreedingSystems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    List<Widget> pages = [
      PageOne(imagePath: "assets/images/cow eating.png"),
     PageOne(imagePath: "assets/images/cow.jpg"),
     PageOne(imagePath: "assets/images/cow two.jpg"),

    ];
    //int indx = 0;
    return Scaffold(
      body: BackGreoundImageContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleRow(textTitle: "Breeding systems"),
                SearchBarCustom(
                    keyboardType: TextInputType.text, hintText: "Search..."),
                SizedBox(
                  height: 800.h,
                  child: PageView(
                    children: [
                      pages[0],
                      pages[1],
                      pages[2],
                    ],
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                  ),
                )
              ],
            ),
          )),
      bottomNavigationBar:  const Mynavbar(),
    );
  }
}