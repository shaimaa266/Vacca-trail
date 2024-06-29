import 'package:app_vacca/features/doctor%20view/features/notes/data/model/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_notes.dart';
import 'widgets/note_container.dart';
class TodayNotes extends StatelessWidget {
  const TodayNotes({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => EditNote(note: note), // Pass the note here
          ),
        );
      },
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
                  note.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),
                Text(
                  note.body!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


