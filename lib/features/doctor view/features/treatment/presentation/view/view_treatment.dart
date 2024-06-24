import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import 'edit treatment.dart';

class TreatmentReview extends StatelessWidget {
  const TreatmentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleRow(textTitle: "Treatment Name "),
              const SizedBox(
                height: 20,
              ),
              getText(text: "   Treatment name ", fontSize: 33, isBold: true),
              getText(text: "   - Lorem ipsum dolor sit amet consectetu", fontSize: 28, isBold: false),
              getText(text: "  -  Hac vel erat pulvinar quis tempor morbi. ", fontSize: 28, isBold: false),
              getText(text: "  -  Pulvinar fringilla eleifend at tristique velit.", fontSize: 28, isBold: false),
              getSpace(),
              getText(
                  text: "   Cause of creation", fontSize: 33, isBold: true),
              getText(
                  text: "  -  Lorem ipsum dolor sit amet consectetue", fontSize: 28, isBold: false),
              getText(
                  text: " -   Hac vel erat pulvinar quis tempor morbi. ", fontSize: 28, isBold:false),
              getText(
                  text: "  -  Pulvinar fringilla eleifend at tristique velit.", fontSize: 28, isBold: false),

              getSpace(),

              getText(text: "  Creation date", fontSize: 33, isBold: true),
              getText(
                  text:
                  "Lorem ipsum dolor sit amet consectetur. Volutpat quam quisque leo quis. Sit rhoncus fringilla eget pellentesque purus. Elit nibh nibh me vitae nec sjdfv oenfc woi djcndu edfcned eiferuifhner fci nc efr3j9 irj2oidj proin auctor.",
                  fontSize: 26,
                  isBold: false),
              getSpace(),
              SizedBox(
                height: 50.h,
                child:
                    getText(text: "medicine used", fontSize: 33, isBold: true),
              ),
              getSpace(),
              SizedBox(
                height: 50.h,
                child: getText(text: "dosage", fontSize: 33, isBold: true),
              ),
              getSpace(),
              const SizedBox(height:  10,),
              Center(
                child: NoteButton(
                  text: "Edit the system ",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditTreatment(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}

Widget getText(
    {required String text, required double fontSize, required bool isBold}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Text(
      text,
      style: TextStyle(
          fontSize: fontSize.sp,
          color: const Color(0xff171A1F),
          fontWeight: isBold ? FontWeight.bold : FontWeight.w700),
    ),
  );
}

Widget getSpace() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: const Color(0xff89A492),
      ),
    );
