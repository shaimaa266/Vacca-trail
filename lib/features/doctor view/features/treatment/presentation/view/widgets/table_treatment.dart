
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/custom_sys_field.dart';

class TreatmentTable extends StatelessWidget {
  TreatmentTable({super.key,required this.isAdd});
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool value = false;
  bool isAdd;
  List <Map<String,bool>>values=[{"taken":true},{"taken":false}];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 570.w,
      child: Table(
        border: const TableBorder(
          verticalInside: BorderSide(color: Color(0xff89A492), width: 1),
          horizontalInside: BorderSide(color: Color(0xff89A492), width: 1),
        ),
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: const Color(0xffC1D5C8),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xff89A492),
                ),
              ),
              children: const [
                SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(
                        child: Text(
                          "Taken",
                          style: TextStyle(fontSize: 24),
                        ))),
                SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(
                        child: Text(
                          "Time",
                          style: TextStyle(fontSize: 24),
                        ))),
                SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(
                        child: Text(
                          "Date",
                          style: TextStyle(fontSize: 24),
                        ))),
              ]),
          TableRow(
              decoration: BoxDecoration(
                color: const Color(0xffFEFDFE),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xff89A492),
                ),
              ),
              children: [
                SizedBox(
                  width: 50,
                  height: 70,
                  child: Checkbox(
                      activeColor: const Color(0xff44885C),
                      /*fillColor: MaterialStateProperty.resolveWith(
                        (Set states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xffFEFDFE).withOpacity(.32);
                          }
                          return const Color(0xff44885C);
                        },
                      ),*/
                      value: value,
                      onChanged: (bool? val) {
                        value = val!;
                      }),
                ),
                SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(
                        child: CustomSysField(
                          withBorder: false,
                          controller: timeController,
                          height: 70,
                          width: 230,
                          isWhite: true,
                          keyboardType: TextInputType.text,
                          readOnly: false,
                          colorHex: const Color(0xff777E82),
                          maxLines: 1,
                          text:isAdd? "":"4:00",
                        ))),
                SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(
                        child: CustomSysField(
                          withBorder: false,
                          controller: timeController,
                          height: 70,
                          width: 180,
                          isWhite: true,
                          keyboardType: TextInputType.text,
                          readOnly: false,
                          colorHex: const Color(0xff777E82),
                          maxLines: 1,
                          text:isAdd? "":"29/4/2024",
                        ),),),
              ],),
        ],
      ),
    );
  }
}
/*class TreatmentTable extends StatefulWidget {
  TreatmentTable({Key? key}) : super(key: key);

  @override
  State<TreatmentTable> createState() => _TreatmentTableState();
}

class _TreatmentTableState extends State<TreatmentTable> {
  final List<Map<String, dynamic>> treatmentData = [
    {'taken': false, 'time': '09:00', 'date': '2024-04-29'},
    {'taken': true, 'time': '12:00', 'date': '2024-04-29'},
    // Add more entries based on your data
  ];

  void _onCheckboxChanged(bool? value, int index) {
    setState(() {
      treatmentData[index]['taken'] = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: 570.w,
      child: Column(
        children: [
          Table(
            border: TableBorder(
              verticalInside: BorderSide(color: const Color(0xff89A492), width: 1),
              horizontalInside: BorderSide(color: const Color(0xff89A492), width: 1),
            ),
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: const Color(0xffC1D5C8),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xff89A492),
                  ),
                ),
                children: const [
                  SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(child: Text("Taken", style: TextStyle(fontSize: 24))),
                  ),
                  SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(child: Text("Time", style: TextStyle(fontSize: 24))),
                  ),
                  SizedBox(
                    width: 50,
                    height: 70,
                    child: Center(child: Text("Date", style: TextStyle(fontSize: 24))),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                border:  const TableBorder(
                  verticalInside: BorderSide(color:  Color(0xff89A492), width: 1),
                  horizontalInside: BorderSide(color:  Color(0xff89A492), width: 1),
                ),
                children: List.generate(treatmentData.length, (index) {
                  final item = treatmentData[index];
                  return TableRow(
                    decoration: BoxDecoration(
                      color: const Color(0xffFEFDFE),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xff89A492),
                      ),
                    ),
                    children: [
                      SizedBox(
                        width: 50.w,
                        height: 70.h,
                        child: Center(
                          child: Checkbox(
                            activeColor: const Color(0xff44885C),
                            value: item['taken'],
                            onChanged: (bool? value) {
                              _onCheckboxChanged(value, index);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                        height: 90.h,
                        child: Center(
                          child: Text(item['time'], style: TextStyle(fontSize: 24)),
                        ),
                      ),
                      SizedBox(
                        width: 50.w,
                        height: 90.h,
                        child: Center(
                          child: Text(item['date'], style: TextStyle(fontSize: 24)),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
