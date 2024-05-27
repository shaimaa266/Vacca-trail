import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../cow_data/data/model/cows_model.dart';

class CowStatusRows extends StatelessWidget with MyConstants {
  final CowModel cow; // Pass the CowModel object directly

  CowStatusRows({Key? key, required this.cow}) : super(key: key);

  void _showBottomSheet(BuildContext context, CowModel cow) {
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
                "Cow ID: ${cow.cowId}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 33.sp,
                    color: titleColor),
              ),
              cow.cow_status == 0
                  ? Text(
                "Not Normal",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 44.sp,
                    color: Colors.red),
              )
                  : Text(
                "Normal",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 44.sp,
                    color: baseColor),
              ),
              Text(
                "Activity system: ${cow.activitysystem_id}",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: titleColor),
              ),
              Text(
                "Activity place: ${cow.activityplace_id}",
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
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          InkWell(
            onTap: () => _showBottomSheet(context, cow),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
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
                    child: cow.cow_status == 0
                        ? Image.asset("assets/images/cow_abnormal.png")
                        : Image.asset("assets/images/cow_normal.png"),
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
                        cow.cowId,
                        style: TextStyle(
                            fontSize: 33.sp, color: titleColor),
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
                      color: cow.cow_status == 0
                          ? Colors.red
                          : containerBorderColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

