import 'dart:io';

import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import '../../data/model/notes_model.dart';

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
          child: Consumer<NotesProvider>(
            builder: (context, notesProvider, child) {
              return Column(
                children: [
                  Row(
                    children: [
                      TitleRow(textTitle: "Edit ${note.noteId}"),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 33, bottom: 6, left: 8, right: 58),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: PopupMenuButton<int>(
                            onSelected: (int value){
                              if(value==1){
                                notesProvider.getStarNote(note.id);
                              }else if(value==2){
                               notesProvider.getRemoveNote(note.id);
                              }else{
                                notesProvider.getUnStarNote(note.id);
                              }

                            },
                              itemBuilder: (BuildContext context) {
                            return  [
                              PopupMenuItem<int>(
                                  value: 1,
                                  child:  IconButton(
                                    onPressed: () async {
                                      await notesProvider
                                          .getStarNote(note.id);
                                      await notesProvider.fetchAllNotes();
                                      print("${note.isStarred}");
                                      Navigator.pop(context);

                                      if (notesProvider.errorMessage == null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => AllNotes(),),);
                                      }
                                    },
                                    icon:  const Row(
                                      children: [
                                        Text(' Star             ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                                        Icon(
                                          Icons.star,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),),
                              PopupMenuItem<int>(
                                value: 3,
                                child:  IconButton(
                                  onPressed: () async {
                                    await notesProvider
                                        .getUnStarNote(note.id);
                                    await notesProvider.fetchAllNotes();
                                    print("${note.isStarred}");
                                    Navigator.pop(context);

                                    if (notesProvider.errorMessage == null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => AllNotes(),),);
                                    }
                                  },
                                  icon:  const Row(
                                    children: [
                                      Text(' unStar             ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),),
                              PopupMenuItem<int>(

                                  value: 2,

                                  child: IconButton(
                                    onPressed: () async {
                                      await notesProvider
                                          .getRemoveNote(note.id);
                                      await notesProvider.fetchAllNotes();
                                      Navigator.pop(context);

                                      if (notesProvider.errorMessage == null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => AllNotes(),),);
                                      }
                                    },
                                    icon:  const Row(
                                      children: [
                                         Text(' delete       ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                                        Icon(
                                          Icons.delete_sharp,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),),
                            ];
                          }),
                        ),
                      ),
                    ],
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
                          text: note.title!,
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
                              text: note.body!,
                              height: 200,
                              width: 560,
                              keyboardType: TextInputType.text,
                              controller: notesProvider.noteDescController,
                              maxLines: 20,
                              readOnly: false,
                              colorHex: const Color(0xff263238),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Center(
                            child: SizedBox(
                              child: InkWell(
                                onTap: () async {
await notesProvider.openImagePicker();
                                },
                                child: SizedBox(
                                  height: 170,
                                  width: 330,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: notesProvider.selectedImagePath == null
                                        ? Image.network(
                                      note.image!,
                                      fit: BoxFit.cover,
                                    )
                                        : Image.file(
                                      File(notesProvider.selectedImagePath!),
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
                  const SizedBox(height: 30),
                  NoteButton(
                    text: "Save",
                    onPressed: () async {
                      await notesProvider.updateNotes(
                        id: note.id,
                        noteId: note.noteId!,
                        cowId: note.cowId!,
                        title: notesProvider.noteNameController.text,
                        body: notesProvider.noteDescController.text,
                        image: '',
                        createdAt: note.createdAt!,
                        updatedAt: DateTime.now().toString(),
                        cow: [],
                      );
                      await notesProvider.fetchAllNotes();
                      if (notesProvider.errorMessage == null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => AllNotes()));
                      }
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
