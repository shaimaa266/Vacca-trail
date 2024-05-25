import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/add_note.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/view_all_notes.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/custom_floating_button.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/doctoer_nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyNotes extends StatelessWidget {
  EmptyNotes({super.key});
  bool isEmpty = false;
  final dynamic route = AddNote();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleRow(textTitle: "     Notes"),
              Row(
                children: [
                  SearchBarCustom(
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
                          // onTap: (){},
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
              ChangeNotifierProvider(
                create: (_) => NotesProvider(),
                child: SizedBox(
                  width: 600,
                  height: 700,
                  child: isEmpty
                      ? Consumer<NotesProvider>(
                          builder: (_, notesProvider, child) => Column(
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
                        )
                      : AllNotes(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        route: route,
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
