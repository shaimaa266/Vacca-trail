

import 'package:app_vacca/features/Ui/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstCowStatusRow extends StatelessWidget  with MyConstants{
  FirstCowStatusRow({required this.imagePath,required this.cowID,required this.isNormal,super.key});

  String imagePath;
  String cowID;
  bool isNormal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 150.h,
        width: 170.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 3),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          imagePath,
          width: 100.w,
          height: 80.h,
          color: isNormal?Colors.green:Colors.red,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Cow ID"),
      ),
      titleTextStyle: TextStyle(fontSize: 33.sp, color: titleColor),
      subtitle: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          cowID,
        ),
      ),
      subtitleTextStyle: TextStyle(color: titleColor, fontSize: 27.sp),
    );
  }
}
