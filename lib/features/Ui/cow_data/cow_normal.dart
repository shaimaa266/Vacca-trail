
import 'package:app_vacca/features/Ui/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/Ui/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/Ui/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/Ui/custom_widgets/first_row_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            Padding(
              padding: const EdgeInsets.only(right: 22, left: 16, top: 22),
              child: SizedBox(
                height: 190.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 250.w,
                      height: 230.h,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/cow eating.png"),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 22, left: 55, right: 30),
                      child: Column(
                        children: [
                          Text(
                            "Cow ID",
                            style: TextStyle(
                                fontSize: 44.sp,
                                fontWeight: FontWeight.w400,
                                color: titleColor),
                          ),
                          Text(
                            "003",
                            style: TextStyle(
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w400,
                                color: titleColor),
                          ),
                          Container(
                            width: 160.w,
                            height: 73.h,
                            decoration: BoxDecoration(
                                color: containerBorderColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: baseColor, width: 2)),
                            child: Center(
                                child: Text(
                              " Normal",
                              style: TextStyle(
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.w400,
                                  color: containerColor),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 22, bottom: 16, right: 16),
              child: SizedBox(
                height: 460.h,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing vitae proin sagittis nisl. Quis enim lobortis scelerisque fermentum dui faucibus in ornare quam.tis nisl.  incididunt ut labore et dolore magna aliqua fermentum dui .Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed de fermentum.",
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const  Mynavbar(),
    );
  }
}
