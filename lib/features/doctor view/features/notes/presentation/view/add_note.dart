import 'dart:io';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/manage/notes_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/edit_notes.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/first_row_title.dart';
import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import 'widgets/add_photo.dart';
import 'widgets/note_container.dart';

class AddNote extends StatelessWidget {
  final int id;

  AddNote({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NotesProvider>(
        builder: (context, noteProvider, child) {
          final note = noteProvider.allNotes[noteProvider.currentPage];
          return BackGreoundImageContainer(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TitleRow(textTitle: "Add Note"),
                          Column(
                            children: [
                              const SizedBox(height: 20, width: 50),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EditNote(note: note),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 35,
                                    color: Colors.green[900]!,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: NoteContainer(
                          value: false,
                          h: 50,
                          w: 600,
                          child: CustomSysField(
                            withBorder: false,
                            isWhite: false,
                            colorHex: const Color(0xff263238),
                            text: "Note title..",
                            height: 100,
                            width: 360,
                            keyboardType: TextInputType.text,
                            controller: noteProvider.noteNameController,
                            maxLines: 1,
                            readOnly: false,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: NoteContainer(
                          value: false,
                          h: 480,
                          w: 600,
                          child: Column(
                            children: [
                              CustomSysField(
                                withBorder: false,
                                isWhite: false,
                                text: "Note Description ..",
                                colorHex: const Color(0xff263238),
                                height: 390,
                                width: 540,
                                keyboardType: TextInputType.text,
                                controller: noteProvider.noteDescController,
                                maxLines: 20,
                                readOnly: false,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                      child: AddImage(
                                        onPickImage: noteProvider.openImagePicker,
                                        imagePath: noteProvider.selectedImagePath,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (noteProvider.selectedImagePath != null)
                                Center(
                                  child: SizedBox(
                                    height: 170,
                                    width: 330,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        File(noteProvider.selectedImagePath!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: NoteButton(
                          text: "Save",
                          onPressed: () async {
                            await noteProvider.getAddNote(
                              image: noteProvider.selectedImagePath,
                              title: noteProvider.noteNameController.text,
                              noteId: '11',
                              cowId: 1,
                              body: noteProvider.noteDescController.text,
                            );
                            await noteProvider.fetchAllNotes();
                            if (noteProvider.errorMessage == null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => AllNotes()),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}

