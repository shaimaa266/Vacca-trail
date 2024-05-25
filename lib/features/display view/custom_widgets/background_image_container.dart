

import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackGreoundImageContainer extends StatelessWidget with MyConstants {
  BackGreoundImageContainer({required this.child, key});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000.w,
      height: 1000.h,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(backgroundImage),
        fit: BoxFit.cover,
      )),
      child: child,
    );
  }
}
