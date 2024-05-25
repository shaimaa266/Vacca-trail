import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerNormal extends StatelessWidget {
  ContainerNormal({required this.text,required this.isSelected, super.key});
  bool isSelected = true;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 16, top: 16, bottom: 26),
      child: Container(
        width: 130.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              isSelected ?  null:Border.all(color: Colors.black54, width: 3) ,
          color: isSelected?Color(0xffb185C30):Colors.red,
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 26.sp),)),
      ),
    );
  }
}
