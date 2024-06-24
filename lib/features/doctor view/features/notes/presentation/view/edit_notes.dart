import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/helper/api_helper.dart';
import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import '../../data/model/notes_model.dart';
import '../../data/repo/note_repo.dart';
import '../manage/notes_provider.dart';
import 'widgets/note_container.dart';

class EditNote extends StatelessWidget {
  final NoteModel note;
  EditNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: ChangeNotifierProvider<NotesProvider>(
            create: (context) => NotesProvider(
                NoteRepo(ApiService(baseUrl: '', dio: Dio(), token: ''))),
            child: Consumer<NotesProvider>(
              builder: (context, notesProvider, child) {
                notesProvider.noteNameController.text = note.title;
                notesProvider.noteDescController.text = note.body;

                return Column(
                  children: [
                    TitleRow(textTitle: "Edit ${note.noteId}"),
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
                            text: note.title,
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
                            /*Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CustomSysField(
                                withBorder: false,
                                isWhite: false,
                                text: '${note.id}',
                                height: 50,
                                width: 560,
                                keyboardType: TextInputType.text,
                                controller: notesProvider.noteDescController,
                                maxLines: 20,
                                readOnly: false,
                                colorHex: const Color(0xff263238),
                              ),
                            ),
                            Center(child: Container(width: 300,height: 1,color: Colors.blueGrey,)),*/

                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CustomSysField(
                                withBorder: false,
                                isWhite: false,
                                text: note.body,
                                height: 200,
                                width: 560,
                                keyboardType: TextInputType.text,
                                controller: notesProvider.noteDescController,
                                maxLines: 20,
                                readOnly: false,
                                colorHex: const Color(0xff263238),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Center(
                              child: SizedBox(
                                child: InkWell(
                                  onTap: () async {
                                    /* final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
    setState(() {
    _imageFile = File(pickedFile.path);*/
                                  },
                                  child: SizedBox(
                                    height: 170,
                                    width: 330,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        note.image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoteButton(
                      text: "Save",
                      onPressed: () {
                        notesProvider.updateNotes(
                            cow: [],
                            body: notesProvider.noteDescController.text,
                            updatedAt: '${DateTime.now()}',
                            createdAt: note.createdAt,
                            cowId: note.cowId,
                            noteId: note.noteId,
                            title: notesProvider.noteNameController.text,
                            id: note.id,
                            //take updated image!
                            image: note.image);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AllNotes()));
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
