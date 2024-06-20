import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFont extends StatelessWidget {
  const TextFont({super.key, required this.height, required this.text,required this.isDark});
final double height;
final String text;
final bool isDark;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: height,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 33.sp,
          fontFamily: 'Urbanist',
          color:isDark==true? const Color(0xff263238):Colors.grey[500],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
