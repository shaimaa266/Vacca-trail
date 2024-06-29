import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRow extends StatelessWidget with MyConstants {
  TitleRow({required this.textTitle, super.key});
  String textTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 33, bottom: 6, left: 8, right: 8),
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Text(
                textTitle,
                style: TextStyle(
                    fontSize: 44.sp,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                    fontFamily: 'Urbanist'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
