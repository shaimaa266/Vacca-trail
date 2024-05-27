import 'package:app_vacca/core/widgets/text%20font%20body.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cow_data/data/model/cows_model.dart';

class CowStatusRows extends StatelessWidget with MyConstants {
  final CowModel cow;

  CowStatusRows({Key? key, required this.cow}) : super(key: key);
  Widget getText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0,bottom: 6.0),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 44.sp,
            fontFamily: 'Urbanist',
            color: titleColor),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, CowModel cow) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 1,
          child: Column(
            children: [
              getText('Id: ${cow.cowId}'),
              getText(" Age : ${cow.age}"),
              cow.cow_status == 0
                  ? Text(
                      "Not Normal",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44.sp,
                          color: Colors.red),
                    )
                  : Text(
                      "Normal ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 44.sp,
                          fontFamily: 'Urbanist',
                          color: baseColor),
                    ),
              getText('Breeding System: ${cow.breadingsystem_id}'),
              getText('Activity system: ${cow.activitysystem_id}'),
              getText("Activity place: ${cow.activityplace_id}"),
              getText('Area : ${cow.original_area}'),
              getText('Weight: ${cow.weight}'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 22),
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
                    width: 180.w,
                    height: 110.h,
                    decoration: BoxDecoration(
                      color: Color(0xffFEFEFE),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.10),
                          blurRadius: 8,
                          spreadRadius: 6,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Image.network(
                      cow.image,
                      fit: BoxFit.fill,
                    ),
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
                        style: TextStyle(fontSize: 33.sp, color: titleColor),
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

        ],
      ),
    );
  }
}
