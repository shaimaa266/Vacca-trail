import 'package:app_vacca/custom_widgets/background_image_container.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';

import 'package:app_vacca/custom_widgets/first_row_title.dart';
import 'package:app_vacca/custom_widgets/navigation_bar_custom.dart';
import 'package:flutter/material.dart';

class CowNormal extends StatelessWidget with MyConstants {
  CowNormal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleRow(textTitle: "Cow Profile"),
            ),
            Container(
              height: 180,
              child: Row(
                children: [
                  Container(
                    width: 250,
                    height: 320,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/cow eating.jfif"),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Cow ID",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              color: titleColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "003",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w400,
                              color: titleColor),
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 86,
                        decoration: BoxDecoration(
                            color: containerBorderColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: baseColor, width: 3)),
                        child: Center(
                            child: Text(
                          " Normal",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: containerColor),
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 44, bottom: 8, left: 16.0, right: 16.0),
              child: SizedBox(
                height: 370,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.tis nisl.  incididunt ut labore et dolore magna aliqua fermentum dui .Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed de fermentum.",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
