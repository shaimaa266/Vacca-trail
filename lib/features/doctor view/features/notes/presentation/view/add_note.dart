
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';


import 'package:flutter/material.dart';

import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import '../../../shared/title.dart';
import 'add_photo.dart';
import 'note_container.dart';

class AddNote extends StatefulWidget {
  AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController noteNameController = TextEditingController();

  final TextEditingController noteDescController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child:  MyTitle(text: "Add Note"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: NoteContainer(
                      value: false,
                      h: 50,
                      w: 600,

                      child: CustomSysField(
                        withBorder: false,
                        isWhite: false,
                        colorHex:  const Color(0xff263238),
                        text: "   Note Name",
                        height: 100,
                        width: 360,
                        keyboardType: TextInputType.text,
                        controller: noteNameController,
                        maxLines: 1,
                        readOnly: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: NoteContainer(
                      value: false,
                      h: 500,
                      w: 600,
                      child: Column(
                        children: [
                          CustomSysField(
                            withBorder: false,
                            isWhite: false,
                            text: "Note Description here",
                            colorHex:  const Color(0xff263238),
                            height: 430,
                            width: 540,
                            keyboardType: TextInputType.text,
                            controller: noteDescController,
                            maxLines: 20,
                            readOnly: false,
                          ),
                          const Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                           AddImage(),
                               SizedBox(width: 20,)
                           ],
                         ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                 Center(child:  NoteButton(text: "save",onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder: (_)=>AllNotes()));
                 },)),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
