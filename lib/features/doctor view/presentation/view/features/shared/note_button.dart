import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoteButton extends StatelessWidget {
   NoteButton({
    super.key,
     required this.onPressed,
    required this.text,
  });
  final String text;
Function ()onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xff44885C),
          ),
          maximumSize: MaterialStateProperty.all<Size>(
            const Size(250, 50),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(230, 40),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),),),
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
