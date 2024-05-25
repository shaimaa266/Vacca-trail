
import 'package:app_vacca/features/doctor%20view/features/treatment/table_treatment.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/treatment.dart';
import 'package:flutter/material.dart';

import '../../../display view/custom_widgets/background_image_container.dart';
import '../../../display view/custom_widgets/first_row_title.dart';
import '../shared/custom_sys_field.dart';
import '../shared/doctoer_nav_bar.dart';
import '../shared/note_button.dart';

class EditTreatment extends StatefulWidget {
  EditTreatment({super.key});

  @override
  State<EditTreatment> createState() => _EditTreatmentState();
}

class _EditTreatmentState extends State<EditTreatment> {
  final TextEditingController noteNameController = TextEditingController();

  final TextEditingController diseasesController = TextEditingController();

  final TextEditingController medicineUsedController = TextEditingController();

  final TextEditingController dosageController = TextEditingController();

  final TextEditingController infoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleRow(textTitle: "Create treatment"),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    text: " Name",
                    height: 50,
                    width: 570,
                    maxLines: 1,
                    colorHex: const Color(0xff777E82),
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    controller: noteNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    text: " diseases",
                    height: 50,
                    width: 570,
                    maxLines: 1,
                    colorHex: const Color(0xff777E82),
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    controller: diseasesController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    text: "medicine used",
                    height: 50,
                    width: 570,
                    maxLines: 1,
                    colorHex: const Color(0xff777E82),
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    controller: medicineUsedController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    text: "dosage",
                    height: 50,
                    width: 570,
                    maxLines: 1,
                    colorHex: const Color(0xff777E82),
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    controller: dosageController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    text: "additional info",
                    height: 130,
                    width: 570,
                    maxLines: 20,
                    colorHex: const Color(0xff777E82),
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    controller: infoController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child:TreatmentTable(isAdd: false,),
                ),
                const  Padding(
                  padding:  EdgeInsets.all(4.0),

                  child: Text("1 February 2024 at 1:23 PM"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NoteButton(text: "save",onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>EmptyTreatment(),),);
                  },),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
