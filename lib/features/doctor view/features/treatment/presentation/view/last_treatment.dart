
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/view_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../notes/presentation/view/widgets/note_container.dart';

class LastTreatment extends StatelessWidget {
  const LastTreatment({super.key});

  @override
  Widget build(BuildContext context) {
    return   ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const TreatmentReview(),),);
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
                    /* noteNameController.text*/
                    "ASDFGHJK",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                  ),
                  Text(
                    /*noteDescController.text*/
                    "asdfghjkle4rfygjfdghjhgfhjdsdfghhjklfghjklsdzfghjklggg",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 22.sp),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
