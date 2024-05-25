
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/ui/home/body/component%20container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget with MyConstants {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: BackGreoundImageContainer(
          
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 57,bottom: 30),
                child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 55.sp),
                    )),
              ),
              SizedBox(height: 650.h, child: ComponentContainer()),
            ],
          ),
        ),
        bottomNavigationBar:   const Mynavbar());
  }
}