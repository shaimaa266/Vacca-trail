import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';

import 'package:app_vacca/features/doctor%20view/features/breeding%20system/view%20system/view_system.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/first_row_title.dart';
import '../../shared/button_customized.dart';
import '../../shared/custom_sys_field.dart';


class EditBreedSystem extends StatefulWidget {
  EditBreedSystem({super.key});

  @override
  State<EditBreedSystem> createState() => _EditSystemState();
}

class _EditSystemState extends State<EditBreedSystem> {
  final TextEditingController nameSysController = TextEditingController();

  final TextEditingController purposeSysController = TextEditingController();

  final TextEditingController causeCreateController = TextEditingController();

  final TextEditingController sysInfoController = TextEditingController();

  final TextEditingController applyDuaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleRow(textTitle: "Edit a system "),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    colorHex: const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 2,
                    controller: nameSysController,
                    text: "System Name ",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    colorHex: const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: purposeSysController,
                    text: "System Goals ",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomSysField(
                    withBorder: true,
                    colorHex: const Color(0xff263238),
                    height: 60,
                    width: 580,
                    isWhite: true,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: causeCreateController,
                    text: "Cause of Creation ",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    colorHex: const Color(0xff263238),
                    height: 140,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: sysInfoController,
                    text: "System  Description ",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomSysField(
                  withBorder: false,
                  isWhite: true,
                  colorHex: const Color(0xff263238),
                  height: 50,
                  width: 580,
                  readOnly: false,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  controller: applyDuaController,
                  text: "Apply on(number of cows) ",
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 22, left: 8, right: 8, bottom: 16),
                  child: Container(
                    width: 350,
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
                      items:
                          ['000', '001', '002', '003', '004', '005', '006'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {},
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                AddButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:const   Center(child: Text('Are you sure?')),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // request done ...
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ViewBreedSystem(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close the dialog
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },

                  text: "Save",
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
