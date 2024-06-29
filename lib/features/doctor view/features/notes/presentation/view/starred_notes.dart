import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/edit_notes.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/doctor_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/first_row_title.dart';
import '../../../../../../core/widgets/search_bar.dart';
import 'widgets/note_container.dart';

class StarredNotes extends StatelessWidget {
  const StarredNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context, listen: false);
    return FutureBuilder(
      future: noteProvider.getAllStarred(),
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
              return Scaffold(
                body: BackGreoundImageContainer(
                  child: Column(
                    children: [
                      TitleRow(textTitle: "  Starred Notes"),
                      Row(
                        children: [
                          SearchBarCustom(
                            controller: noteProvider.searchController,
                            onTap: () {},
                            onPressedSearch: () {},
                            w: 536,
                            h: 50,
                            keyboardType: TextInputType.text,
                            hintText: "Search in starred Notes",
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.green[900],
                            size: 50,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 600,
                        height: 500,
                        child:noteProvider.staredNotes.isNotEmpty? ListView.builder(
                          itemCount: noteProvider.staredNotes.length,
                          itemBuilder: (BuildContext context, int index) {
                            final note = noteProvider
                                .staredNotes[noteProvider.currentPage];
                            return Column(children: [

                             Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                  InkWell(
                                  onTap: () {
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                  builder: (_) =>
                                  EditNote(note: note)));
                                  },
                                        child: NoteContainer(
                                          value: true,
                                          h: 100.h,
                                          w: 900.w,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  note.title!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 33.sp,
                                                  ),
                                                ),
                                                Text(
                                                  note.body!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 30.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: IconButton(
                                            onPressed: () {
                                              noteProvider
                                                  .getUnStarNote(note.id);
                                              noteProvider.getAllStarred();
                                            },
                                            icon: const Icon(
                                              CupertinoIcons.star_slash_fill,
                                              size: 45,
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),

                              SizedBox(height: 30),
                            ]);
                          },
                        ): const Center(child: Text('no starred notes '))
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: DoctorNavBar(),
              );
            },
          );
        }
      },
    );
  }
}
