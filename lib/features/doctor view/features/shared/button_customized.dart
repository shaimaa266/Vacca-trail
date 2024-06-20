import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.text,required this.onPressed});
  final String text;
 final Function ()onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(0xff44885C),
        ),
        maximumSize: MaterialStateProperty.all<Size>(
          const Size(300, 50),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(250, 40),
        ),
        shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),

        ))

      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 33.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xffEAEEEC),
        ),
      ),
    );
  }
}
