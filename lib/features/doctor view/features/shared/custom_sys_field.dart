import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSysField extends StatelessWidget {
  CustomSysField(
      {super.key,
      required this.controller,
      required this.maxLines,
      required this.keyboardType,
      required this.readOnly,
      required this.text,
      required this.height,
      required this.isWhite,
      required this.width,
        required this.withBorder,
      required this.colorHex});
  final TextEditingController controller;
  final int maxLines;
  final bool readOnly;
  final TextInputType keyboardType;
  final String text;
  final double height;
  final double width;
  bool withBorder;
  Color colorHex;
  bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: withBorder?Border.all(color: const Color(0xff89A492),width: 1,):null,
        color: isWhite ? const Color(0xffFEFDFE) : const Color(0xffCDDDD3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        child: TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          textAlign: TextAlign.start,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            focusColor: Colors.white,
            hintStyle: TextStyle(
              color: colorHex,
              fontWeight: FontWeight.w500,
              fontSize: 28.sp,
            ),
          ),
        ),
      ),
    );
  }
}
