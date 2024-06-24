import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20system/edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/first_row_title.dart';
import '../shared/button_customized.dart';

class ViewActSystem extends StatefulWidget {
  ViewActSystem({super.key});

  @override
  State<ViewActSystem> createState() => _ViewSystemState();
}

class _ViewSystemState extends State<ViewActSystem> {
  final dynamic editSystemRoute = EditActSystem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Column(
              children: [
                TitleRow(textTitle: "system name  "),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 580.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xff89A492), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            //purposeSysController.text,
                            "System Goals",
                            style: TextStyle(
                                fontSize: 33.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //purposeSysController.text,
                            "- Lorem ipsum dolor sit amet conjecture",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //purposeSysController.text,
                            "- Hac vel erat pulmonary quits temper morbid",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //purposeSysController.text,
                            "- Pulmonary flavoring effendi at veldt.",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 580.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xff89A492), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // causeCreateController.text,
                            "Cause of Creation ",
                            style: TextStyle(
                                fontSize: 33.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            // causeCreateController.text,
                            "- Lorem ipsum dolor sit amet conjecture ",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            // causeCreateController.text,
                            "- Hac vel erat pulmonary quits temper morbid ",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            // causeCreateController.text,
                            "- Pulmonary flavoring effendi at veldt. ",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 580.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    border:
                        Border.all(color: const Color(0xff89A492), width: 1),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            //sysInfoController.text,
                            " System Description",
                            style: TextStyle(
                                fontSize: 33.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //sysInfoController.text,
                            " - Lorem ipsum dolor sit amet conjecture",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //sysInfoController.text,
                            " - Hac vel erat pulmonary quits temper morbid",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            //sysInfoController.text,
                            " - Pulmonary flavoring effendi at veldt.",
                            style: TextStyle(
                                fontSize: 25.sp, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 580.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      color: Colors.white,
                      border:
                          Border.all(color: const Color(0xff89A492), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          //  applyDuaController.text,
                          "applied on (no of cows)",
                          style: TextStyle(
                              fontSize: 33.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 16),
                  child: Container(
                    width: 350,
                    height: 40,
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
                AddButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => editSystemRoute,),
                    );
                  },

                  text: "edit the system",
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
