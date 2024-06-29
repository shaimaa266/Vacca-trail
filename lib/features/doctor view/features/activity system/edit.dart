import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20system/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../display view/activity_system/data/models/activity_system_model.dart';
import '../../../display view/activity_system/presentation/control/activity_system_provider.dart';
import '../shared/button_customized.dart';
import '../shared/custom_sys_field.dart';

class EditActSystem extends StatelessWidget {

  final ActivitySystemModel activitySystemModel;

  const EditActSystem({super.key, required this.activitySystemModel});

  @override
  Widget build(BuildContext context) {
    final actSystem =
    Provider.of<ActivitySystemsProvider>(context, listen: false);

    return Scaffold(
      body: BackGreoundImageContainer(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 43,
            bottom: 8,
          ),
          child: FutureBuilder(
              future: actSystem.fetchAllActivitySystems(),
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
                  return Consumer<ActivitySystemsProvider>(
                      builder: (context, noteProvider, child) {
                        if (noteProvider.errorMessage != null) {
                          return Center(
                            child: Text(noteProvider.errorMessage!),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TitleRow(textTitle: " edit  a system  "),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 50,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 1,
                                    controller: actSystem.nameSysController,
                                    text: activitySystemModel.name,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 50,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 20,
                                    controller: actSystem.purposeSysController,
                                    text: activitySystemModel.goal,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 50,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 20,
                                    controller: actSystem.causeCreateController,
                                    text: activitySystemModel.goal,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 140,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 25,
                                    controller: actSystem.sysInfoController,
                                    text: activitySystemModel.description,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 50,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 5,
                                    controller: actSystem.activitiesController,
                                    text: actSystem.activitiesController.text,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomSysField(
                                    withBorder: true,
                                    isWhite: true,
                                    colorHex: const Color(0xff263238),
                                    height: 50,
                                    width: 580,
                                    readOnly: false,
                                    keyboardType: TextInputType.text,
                                    maxLines: 5,
                                    controller: actSystem.activityDuaController,
                                    text:actSystem.activityDuaController.text,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 8, right: 8, bottom: 34),
                                  child: Container(
                                    width: 340,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xff89A492),
                                          width: 1.2),
                                    ),
                                    child: DropdownButton(
                                      focusColor: const Color(0xff44885C),
                                      hint: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Applied on ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ),
                                      isExpanded: true,
                                      iconSize: 40.0,
                                      style: const TextStyle(
                                        color: Color(0xff44885C),
                                      ),
                                      items: [
                                        '000',
                                        '001',
                                        '002',
                                        '003',
                                        '004',
                                        '005',
                                        '006'
                                      ].map(
                                            (val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (val) {},
                                    ),
                                  ),
                                ),
                                AddButton(
                                  onPressed: () async {
                                    await actSystem.getUpdateSystem(
                                        id: actSystem.activitySystems.length,
                                        name: actSystem.nameSysController.text,
                                        goal: actSystem.purposeSysController.text,
                                        causeOfCreation:
                                        actSystem.causeCreateController.text,
                                        description:
                                        actSystem.sysInfoController.text,
                                        activities:
                                        actSystem.activitiesController.text,
                                        cows: [],
                                        cowCount: 6);
                                    await actSystem.fetchAllActivitySystems();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewActSystem(activitySystemModel: activitySystemModel,),
                                      ),
                                    );
                                  },
                                  text: "edit system",
                                ),
                              ],
                            ),
                          );
                        }
                      });
                }
              }),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
