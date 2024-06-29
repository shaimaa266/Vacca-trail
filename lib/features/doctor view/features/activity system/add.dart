import 'package:app_vacca/features/display%20view/activity_system/data/models/activity_system_model.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../shared/button_customized.dart';
import '../shared/custom_sys_field.dart';
import 'doctor activity sys.dart';

class AddActSystem extends StatelessWidget {
  final ActivitySystemModel activitySystemModel;

  AddActSystem({super.key, required this.activitySystemModel});
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
            child: Consumer<ActivitySystemsProvider>(
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
                        TitleRow(textTitle: " Create a system  "),
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
                            text: 'system name ',
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
                            text: "System Purpose ",
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
                            text: "Cause of Creation ",
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
                            height: 100,
                            width: 580,
                            readOnly: false,
                            keyboardType: TextInputType.text,
                            maxLines: 25,
                            controller: actSystem.sysInfoController,
                            text: "System  Description ",
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
                            text: "Activities  ",
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
                            text: "Activities duration  ",
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
                                  color: const Color(0xff89A492), width: 1.2),
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
                            await actSystem.getAddSystem(
                                id: actSystem.activitySystems.length,
                                name: actSystem.nameSysController.text,
                                goal: actSystem.purposeSysController.text,
                                causeOfCreation:
                                    actSystem.causeCreateController.text,
                                description: actSystem.sysInfoController.text,
                                activities: actSystem.activitiesController.text,
                                cows: [],
                                cowCount: 6);
                            await actSystem.fetchAllActivitySystems();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ActivitySysDoctorPage(),
                              ),
                            );
                          },
                          text: "add a custom system",
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: const Mynavbar());
  }
}
