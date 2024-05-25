import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortIcon extends StatelessWidget {
  const SortIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed: () {},
        icon: Image.asset(
          "assets/images/sort icon.png",
          width: 90.w,
          height: 80.h,
          color: Colors.black87,
        ));
  }
}
