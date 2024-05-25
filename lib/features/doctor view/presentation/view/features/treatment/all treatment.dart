import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/note_container.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/treatment/edit%20treatment.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/treatment/last_treatment.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/treatment/today_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllTreatments extends StatelessWidget {
  AllTreatments ({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          const Text(
            "Today",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),


          SizedBox(
            height: 215.h,
            width: 680.w,
            child:  const TodayTreatment(),
          ),


          const Text(
            "Yesterday",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 420.h,
            width: 650.w,
            child: const LastTreatment(),
          ),
        ],
      ),
    );
  }
}
