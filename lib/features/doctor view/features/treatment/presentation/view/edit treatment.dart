import 'package:app_vacca/features/doctor%20view/features/treatment/data/model/treatment_model.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/widgets/table_treatment.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/background_image_container.dart';
import '../../../../../../core/widgets/first_row_title.dart';
import '../../../shared/custom_sys_field.dart';
import '../../../shared/doctor_nav_bar.dart';
import '../../../shared/note_button.dart';
import '../control/treatment_provider.dart';

class EditTreatment extends StatelessWidget {
  const EditTreatment(
      {super.key, required this.cowId, required this.treatmentModel});
  final int cowId;
  final TreatmentModel treatmentModel;
  @override
  Widget build(BuildContext context) {
    final treatmentProvider =
        Provider.of<TreatmentProvider>(context, listen: false);
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SafeArea(
          child: SingleChildScrollView(
              child: FutureBuilder(
                  future: treatmentProvider.fetchAllTreatments(cowId),
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
                      return Consumer<TreatmentProvider>(
                          builder: (context,treatProvider, child) {
                        if (treatProvider.errorMessage != null) {
                          return Center(
                            child: Text(treatProvider.errorMessage!),
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  TitleRow(textTitle: "Edit treatment"),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomSysField(
                                  withBorder: true,
                                  isWhite: true,
                                  text: treatmentModel.name!,
                                  height: 50,
                                  width: 570,
                                  maxLines: 1,
                                  colorHex: const Color(0xff777E82),
                                  readOnly: false,
                                  keyboardType: TextInputType.text,
                                  controller: treatProvider.noteNameController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSysField(
                                  withBorder: true,
                                  isWhite: true,
                                  text: treatmentModel.disease!,
                                  height: 50,
                                  width: 570,
                                  maxLines: 1,
                                  colorHex: const Color(0xff777E82),
                                  readOnly: false,
                                  keyboardType: TextInputType.text,
                                  controller: treatProvider.diseasesController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSysField(
                                  withBorder: true,
                                  isWhite: true,
                                  text: treatmentModel.diagnose!,
                                  height: 50,
                                  width: 570,
                                  maxLines: 1,
                                  colorHex: const Color(0xff777E82),
                                  readOnly: false,
                                  keyboardType: TextInputType.text,
                                  controller:
                                  treatProvider.medicineUsedController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSysField(
                                  withBorder: true,
                                  isWhite: true,
                                  text: '3',
                                  height: 50,
                                  width: 570,
                                  maxLines: 1,
                                  colorHex: const Color(0xff777E82),
                                  readOnly: false,
                                  keyboardType: TextInputType.text,
                                  controller: treatProvider.dosageController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSysField(
                                  withBorder: true,
                                  isWhite: true,
                                  text:'${treatmentModel.treatmentDoseTimes}',
                                  height: 130,
                                  width: 570,
                                  maxLines: 20,
                                  colorHex: const Color(0xff777E82),
                                  readOnly: false,
                                  keyboardType: TextInputType.text,
                                  controller: treatProvider.infoController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: TreatmentTable(
                                  isAdd: false,
                                ),
                              ),
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(treatmentModel.createdAt!),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NoteButton(
                                  text: "save",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EmptyTreatments(id: 10,),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                        }
                      });
                    }
                  },),),
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}
