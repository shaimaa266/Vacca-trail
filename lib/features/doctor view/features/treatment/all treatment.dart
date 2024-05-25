
import 'package:app_vacca/features/doctor%20view/features/treatment/today_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'last_treatment.dart';

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
