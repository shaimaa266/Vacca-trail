import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.route});
final dynamic route;
  @override
  Widget build(BuildContext context) {
    return    Center(
      child: Container(
        width: 245.w,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xff44885C)),
        child: MaterialButton(
          child: const Text(
            "view more",
            style: TextStyle(
                color: Color(0xffEAEEEC),
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>route,
              ),
            );
          },
        ),
      ),
    );
  }
}
