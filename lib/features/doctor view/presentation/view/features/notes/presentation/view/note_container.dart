import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteContainer extends StatelessWidget {
  NoteContainer(
      {super.key,
      required this.h,
      required this.w,
      required this.child,
      required this.value});
  final double h;
  final double w;
  final Widget child;
  bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w.w,
      height: h.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: value
            ? const Border(
                left: BorderSide(
                  color: Color(
                    0xff44885C,
                  ),
                  width: 20,
                ),
              )
            : const Border(left: BorderSide.none),
        color: const Color(0xffCDDDD3),
      ),
      child: child,
    );
  }
}
