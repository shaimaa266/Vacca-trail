
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/today_notes.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/yesterday%20notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AllNotes extends StatelessWidget {
  AllNotes({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>NotesProvider() ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 215.h, width: 680.w, child: const TodayNotes()),
            const Text(
              "Yesterday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 420.h,
              width: 650.w,
              child: const YesterdayNotes(),
            ),
          ],
        ),
      ),
    );
  }
}
