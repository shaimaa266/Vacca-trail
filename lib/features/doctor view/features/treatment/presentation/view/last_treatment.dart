
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/view_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../notes/presentation/view/widgets/note_container.dart';
import '../../data/model/treatment_model.dart';

class LastTreatment extends StatelessWidget {
  const LastTreatment({super.key,required this.treatmentModel});
  final TreatmentModel treatmentModel;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>  ViewTreatment(treatmentModel: treatmentModel, cowId:treatmentModel.cowId! ,),),);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NoteContainer(
            value: true,
            h:80.h,
            w: 650.w ,

            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    treatmentModel.name!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                  ),
                  Text(
                    treatmentModel.diagnose!,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 22.sp),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
