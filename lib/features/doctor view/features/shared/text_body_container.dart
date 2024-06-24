import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBodyContainer extends StatelessWidget {
  const TextBodyContainer( {super.key,required this.text,});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,  style: TextStyle(
        fontSize: 24.sp,
        color: Colors.blueGrey,
        fontWeight: FontWeight.bold),
    overflow: TextOverflow.ellipsis,);
  }
}
