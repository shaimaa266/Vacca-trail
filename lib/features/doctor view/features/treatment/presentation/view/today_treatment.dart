import 'package:app_vacca/features/doctor%20view/features/treatment/data/model/treatment_model.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/view_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../notes/presentation/view/widgets/note_container.dart';

class TodayTreatment extends StatelessWidget {
  const TodayTreatment({super.key, required this.treatmentModel});
  final TreatmentModel treatmentModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NoteContainer(
          value: true,
          h: 80.h,
          w: 650.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  treatmentModel.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                ),
                Text(
                  treatmentModel.diagnose!,
                  style:
                      TextStyle(fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis, fontSize: 22.sp),
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>   ViewTreatment(
              treatmentModel: treatmentModel,
              cowId: treatmentModel.cowId!,
            ),
          ),
        );
      },
    );
  }
}
