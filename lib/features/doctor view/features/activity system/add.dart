
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/button_customized.dart';
import '../shared/custom_sys_field.dart';
import '../shared/title.dart';
import 'doctor activity sys.dart';

class AddActSystem extends StatefulWidget {
  AddActSystem({super.key});

  @override
  State<AddActSystem> createState() => _AddSystemState();
}

class _AddSystemState extends State<AddActSystem> {
  final TextEditingController nameSysController = TextEditingController();

  final TextEditingController purposeSysController = TextEditingController();

  final TextEditingController causeCreateController = TextEditingController();

  final TextEditingController sysInfoController = TextEditingController();

  final TextEditingController applyDuaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Padding(
          padding: const EdgeInsets.only(top:43,bottom: 8,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyTitle(text: " Create a system  "),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    controller: nameSysController,
                    text: "System Name ",
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
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: purposeSysController,
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
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: purposeSysController,
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
                    colorHex:  const Color(0xff263238),
                    height: 140,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 25,
                    controller: sysInfoController,
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
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    controller: applyDuaController,
                    text: "Apply Duration ",
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 8,right: 8,bottom: 34),
                  child: Container(
                    width: 340,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: const Color(0xff89A492), width: 1.2),
                    ),
                    child: DropdownButton(
                      focusColor:   const Color(0xff44885C),
                      hint: const  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  Text(
                          "Applied on ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                      isExpanded: true,
                      iconSize: 40.0,
                      style:  const TextStyle(
                        color:  Color(0xff44885C),
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
                 AddButton(
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (_) =>ActivitySysDoctorPage(),),
                     );
                   },

                  text: "add a custom system",
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
