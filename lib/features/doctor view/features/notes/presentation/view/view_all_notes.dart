import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/add_note.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/today_notes.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/yesterday%20notes.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/first_row_title.dart';
import '../../../../../../core/widgets/search_bar.dart';
import '../../../shared/custom_floating_button.dart';

class AllNotes extends StatelessWidget {
  AllNotes({super.key, this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context, listen: false);

    return FutureBuilder(
      future: noteProvider.fetchAllNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitHourGlass(
              color: Colors.green.shade700,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Consumer<NotesProvider>(
            builder: (context, noteProvider, child) {
              if (noteProvider.errorMessage != null) {
                return Center(
                  child: Text(noteProvider.errorMessage!),
                );
              } else {
                final todayNotes = noteProvider.allNotes.take(6).toList();
                final yesterdayNotes = noteProvider.allNotes.skip(6).take(4).toList();

                return Scaffold(
                  body: BackGreoundImageContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleRow(textTitle: "     Notes"),
                          Row(
                            children: [
                              SearchBarCustom(
                                controller: noteProvider.searchController,
                                onTap: () {},
                                onPressedSearch: () {},
                                w: 520,
                                h: 50,
                                keyboardType: TextInputType.text,
                                hintText: "Search your Notes",
                              ),
                              PopupMenuButton(
                                icon: Image.asset('assets/images/star.png'),
                                itemBuilder: (context) => [
                                  const PopupMenuItem(
                                    value: 1,
                                    child: InkWell(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "delete",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.delete_forever_sharp,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 2,
                                    child: InkWell(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "star",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.star_outlined,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                offset: const Offset(0, 100),
                                color: const Color(0xffFEFDFE),
                                elevation: 0,
                              ),
                            ],
                          ),
                          const Text(
                            "Today",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(
                            height: 215.h,
                            width: 680.w,
                            child: ListView.builder(
                                itemCount: todayNotes.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final note = todayNotes[index];
                                  return TodayNotes(note: note);
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Yesterday",
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(
                            height: 350.h,
                            width: 680.w,
                            child: ListView.builder(
                                itemCount: yesterdayNotes.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final note = yesterdayNotes[index];
                                  return YesterdayNotes(note: note);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: DoctorNavBar(),
                  floatingActionButton: CustomFloatingButton(
                   onPressed: (){

                     Navigator.push(context, MaterialPageRoute(builder: (_)=>
                         AddNote()));
                   },
                  ),
                );
              }
            },
          );
        }
      },
    );
  }
}

