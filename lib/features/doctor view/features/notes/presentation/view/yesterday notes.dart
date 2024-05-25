
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_notes.dart';
import 'note_container.dart';

class YesterdayNotes extends StatelessWidget {
  const YesterdayNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote()));
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                  ),
                  Text(
                    /*noteDescController.text*/
                    "asdfghjkle4rfygjfdghjhgfhjdszdfxcgvnhbm",
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
