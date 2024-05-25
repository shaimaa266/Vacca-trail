import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFont extends StatelessWidget {
  const TextFont({super.key, required this.height, required this.text});
final double height;
final String text;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: height,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 33.sp,
          fontFamily: 'Urbanist',
          color: const Color(0xff263238),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
