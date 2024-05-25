


import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CowStatusRows extends StatelessWidget with MyConstants {
  bool cowRed;
  CowStatusRows({required this.cowRed, Key? key}) : super(key: key);

  static int _index = 0;
  static List<bool> cowStatusList = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    false,
    true
  ];
  List<String> id = [
    "000",
    "001",
    "002",
    "003",
    "004",
    "005",
    "006",
    "007",
    "008",
    "009"
  ];
  _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.95,
          child: Column(
            children: [
              Text(
                "Cow ID: ${id[_index]}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 33.sp,
                    color: titleColor),
              ),
              cowRed
                  ? Text(
                      "  Not Normal  ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44.sp,
                          color: Colors.red),
                    )
                  : Text("Normal",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44.sp,
                          color: baseColor)),
              Text(
                " Activity system : 02   ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: titleColor),
              ),
              Text(
                "  Activity place : 01",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 33.sp,
                    color: titleColor),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    cowRed = cowStatusList[_index];

    _index = (_index + 1) % cowStatusList.length;

    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          InkWell(
              onTap: () {
                Container(
                  child: _showBottomSheet(context),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Container(
                        height: 500.h,
                        decoration: BoxDecoration(
                          color: Colors.white30,
                        ),
                        child: _showBottomSheet(context),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0,left: 20),
                          child: Container(
                          width: 160.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Color(0xffFEFEFE),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  blurRadius: 8,
                                  spreadRadius: 6,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: cowRed
                                ? Image.asset("assets/images/cow ubnormal.png")
                                : Image.asset("assets/images/cow normal.png"),
                          ),
                        ),
                        Padding(

                          padding: const EdgeInsets.only(right: 89.0),
                          child: Column(
                            children: [
                              Text("COW ID:",
                                  style: TextStyle(
                                    fontSize: 36.sp,
                                    color: titleColor,
                                  )),
                              Text(
                                "${id[_index]}",
                                style:
                                    TextStyle(fontSize: 33.sp, color: titleColor),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            width: 80.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: cowRed ? Colors.red : containerBorderColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
