import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/core/widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../shared/custom_floating_button.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../manage/notes_provider.dart';
import 'add_note.dart';

class EmptyNotes extends StatelessWidget {
  EmptyNotes({super.key, this.id});
  final int? id;

  final TextEditingController controller = TextEditingController();
  void fetchInitialData(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context, listen: false);
    noteProvider.fetchAllNotes().then((_) {
      if (id != null) {
        final initialIndex = noteProvider.allNotes.indexWhere(
          (place) => place.id == id,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, noteProvider, child) {
      if (noteProvider.isLoading) {
        return Center(
          child: SpinKitHourGlass(
            color: Colors.green.shade700,
          ),
        );
      } else if (noteProvider.errorMessage != null) {
        return Center(
          child: Text(noteProvider.errorMessage!),
        );
      } else {
        return noteProvider.allNotes.isEmpty
            ? Scaffold(
                body: BackGreoundImageContainer(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TitleRow(textTitle: "     Notes"),
                        Row(
                          children: [
                            SearchBarCustom(
                              controller: controller,
                              onTap: () {},
                              onPressedSearch: () {},
                              w: 555,
                              h: 50,
                              keyboardType: TextInputType.text,
                              hintText: "Search your Notes",
                            ),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 1,
                                  child: InkWell(
                                    // onTap: (){},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    // onTap: (){},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                        SizedBox(
                          width: 600,
                          height: 700,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/note.png"),
                              const Text(
                                "No Notes yet!",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: CustomFloatingButton(
                  onPressed: () async {
                    final note =
                        noteProvider.allNotes[noteProvider.currentPage];
                    await noteProvider.fetchAllNotes();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddNote(
                                  id: note.id,
                                ),),);
                  },
                ),
                bottomNavigationBar: DoctorNavBar(),
              )
            : AllNotes();
      }
    });
  }
}
