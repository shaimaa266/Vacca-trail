
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/activity%20place/doctor%20activity%20place.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/button_customized.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/custom_sys_field.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/shared/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPlace extends StatefulWidget {
  EditPlace({super.key});

  @override
  State<EditPlace> createState() => _EditSystemState();
}

class _EditSystemState extends State<EditPlace> {
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
                const MyTitle(text: "Edit a Place"),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CustomSysField(
                    withBorder: true,
                    isWhite: true,
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 2,
                    controller: nameSysController,
                    text: "Place Name ",
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
                    colorHex:  const Color(0xff263238),
                    height: 50,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: purposeSysController,
                    text: "place Goals ",
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
                    colorHex:  const Color(0xff263238),
                    height: 140,
                    width: 580,
                    readOnly: false,
                    keyboardType: TextInputType.text,
                    maxLines: 20,
                    controller: sysInfoController,
                    text: "place  Description ",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 340,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff89A492), width: 1),
                        color: Colors.white
                    ),
                    child: Text(
                      " Capacity of place            30cows ",
                      style: TextStyle(
                        color: const Color(0xff777E82),
                        fontWeight: FontWeight.w500,
                        fontSize: 31.sp,
                      ),
                    ),
                  ),
                ), SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: 340,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: const Color(0xff89A492), width: 1),
                          color: Colors.white
                      ),
                      child: Text(
                          " number of actual cows in place    23 cows ",
                        style: TextStyle(
                          color: const Color(0xff777E82),
                          fontWeight: FontWeight.w500,
                          fontSize: 29.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                CustomSysField(
                  withBorder: true,
                  isWhite: true,
                  height: 50,
                  width: 580,
                  readOnly: false,
                  colorHex:  const Color(0xff263238),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  controller: applyDuaController,
                  text: "Apply on(number of cows) ",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 16),
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
                const SizedBox(height: 20,),
                const AddButton(
                  route: ActivityPlaceDoctorPage(),
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
