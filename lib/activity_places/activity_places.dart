import 'package:app_vacca/activity_system/page_one.dart';
import 'package:app_vacca/custom_widgets/background_image_container.dart';
import 'package:app_vacca/custom_widgets/first_row_title.dart';
import 'package:app_vacca/custom_widgets/navigation_bar_custom.dart';

import 'package:app_vacca/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ActivityPlaces extends StatelessWidget {
  const ActivityPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    List<Widget> pages = [
      PageOne(imagePath: "assets/images/cow eating in place.jpg"),
       const Center(
        child: Text("page 2"),
      ),
       const Center(
        child: Text("page 3"),
      ),
    ];
    //int indx = 0;
    return Scaffold(
      body: BackGreoundImageContainer(
          child: SingleChildScrollView(
            child: Column(
        children: [
            TitleRow(textTitle: "Activity Places"),
            SearchBarCustom(
                keyboardType: TextInputType.text, hintText: "Search..."),
            SizedBox(
              height: 500,
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
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
