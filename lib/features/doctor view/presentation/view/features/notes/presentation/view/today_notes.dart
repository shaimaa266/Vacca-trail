import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/edit_notes.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/note_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TodayNotes extends StatelessWidget {
  const TodayNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote(),),);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChangeNotifierProvider(
              create: (context)=>NotesProvider(),
              child: NoteContainer(
                value: true,
                h: 80.h,
                w: 650.w,

                child:  Padding(
                  padding: const  EdgeInsets.all(8.0),
                  child: Consumer(
                    builder: (context,notesProvider,child)=>
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                  /* notesProvider.noteNameController.text,*/
                          " ASDFGHJK",

                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.sp),
                        ),
                        Text(
                          /* notesProvider.noteDescController.text,*/
                          "asdfghjkle4rfygjhkjlsedfcgjk",
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
          ),
        )
    );
  }
}
