import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import '../manage/notes_provider.dart';
import 'note_container.dart';

class EditNote extends StatelessWidget {
  EditNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChangeNotifierProvider<NotesProvider>(
              create: (context) => NotesProvider(),
              child: Consumer<NotesProvider>(
                builder: (context, notesProvider, child) => Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TitleRow(textTitle: "Edit Notes"),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NoteContainer(
                        value: false,
                        h: 60,
                        w: 600,
                        child: Center(
                          child: CustomSysField(
                            withBorder: false,
                            isWhite: false,
                            text: " Lorem ipsum dolor",
                            height: 100,
                            width: 360,
                            keyboardType: TextInputType.text,
                            controller: notesProvider.noteNameController,
                            maxLines: 1,
                            readOnly: false,
                            colorHex: const Color(0xff263238),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NoteContainer(
                        value: false,
                        h: 480,
                        w: 600,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CustomSysField(
                                  withBorder: false,
                                  isWhite: false,
                                  text:
                                      "Lorem ipsum dolor sit amet consec tetur. Hac vel erat pulvinar quis tem por morbi. Pulvinar fringilla eleifend at tris tique velit sjdcbsu dcjh kla dlwxsn dkrfn kjdf nsd fefjns fkef ldwe l yjhtjh6t7d,fvknes fwkef efertryjj fnv Hac vel erat pulvinar quis tem por morbi. Pulvinar fringilla eleifend at tris tique velit sjdcbsu dcjh kla dlwxsn.",
                                  height: 250,
                                  width: 560,
                                  keyboardType: TextInputType.text,
                                  controller: notesProvider.noteDescController,
                                  maxLines: 20,
                                  readOnly: false,
                                  colorHex: const Color(0xff263238),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  child: InkWell(
                                    onTap: () {},
                                    child: SizedBox(
                                        height: 170,
                                        width: 330,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "assets/images/cow breeding.png",
                                              fit: BoxFit.cover,
                                            ))),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                    const SizedBox(height: 30),
                    NoteButton(
                      text: "save",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AllNotes()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
