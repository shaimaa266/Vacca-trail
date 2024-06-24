import 'package:app_vacca/features/display%20view/activity_places/presentation/view/activity_places.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/view/activity_systems.dart';
import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding_systems.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cow_data/data/model/cows_model.dart';

class CowStatusRows extends StatelessWidget with MyConstants {
  final CowModel cow;

  CowStatusRows({super.key, required this.cow});

  Widget getText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36.sp,
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
          heightFactor: .85,
          widthFactor: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText('Id: ${cow.cowId}'),
                getSpace(),
                getText(" Age : ${cow.age}"),
                getSpace(),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        " status: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            color: Colors.black),
                      ),
                      cow.cow_status == 0
                          ? Text(
                        "  Not Normal",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            color: Colors.red),
                      )
                          : Text(
                        "  Normal ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            fontFamily: 'Urbanist',
                            color: baseColor),
                      ),
                    ],
                  ),
                ),

                getSpace(),
                Row(
                  children: [
                    Text(
                      " Pregnancy status:",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 36.sp,
                          color: Colors.black),
                    ),
                    cow.isPregnant == 1
                        ? Text(
                      " Pregnant",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 36.sp,
                          color: Colors.red),
                    )
                        : Text(
                      " Not pregnant ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 36.sp,
                          fontFamily: 'Urbanist',
                          color: baseColor),
                    ),
                  ],
                ),

                getSpace(),
                getText('Area : ${cow.original_area}'),
                getSpace(),
                getText('Weight: ${cow.weight}'),
                getSpace(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BreedingSystems(
                          initialBreedingSystemId: cow.breadingsystem_id,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Breeding System id:   ${cow.breadingsystem_id}             ",
                        style: TextStyle(
                            decorationThickness: 4,
                            decorationColor: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            fontFamily: 'Urbanist',
                            color: titleColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),
                getSpace(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ActivitySystems(
                          initialSystemId: cow.activitysystem_id,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Activity System id:   ${cow.activitysystem_id}             ",
                        style: TextStyle(
                            decorationThickness: 4,
                            decorationColor: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            fontFamily: 'Urbanist',
                            color: titleColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),
                getSpace(),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ActivityPlaces(
                          initialPlaceId: cow.activityplace_id,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Existing place id:   ${cow.activityplace_id}             ",
                        style: TextStyle(
                            decorationThickness: 4,
                            decorationColor: Colors.blueGrey,
                            fontWeight: FontWeight.w700,
                            fontSize: 36.sp,
                            fontFamily: 'Urbanist',
                            color: titleColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: titleColor,
                      ),
                    ],
                  ),
                ),

              ],
            ),
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
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.15),
                            blurRadius: 8,
                            spreadRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: cow.image != ''
                            ? Image.network(
                                cow.image!,
                                fit: BoxFit.cover,
                              )
                            : Image.asset("assets/images/cow eating.png"),
                      )),
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
                        cow.cowId!,
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
  Widget getSpace(){
    return Container(
      width: 150,
      height: 1,
      color: Colors.grey[400],
    );
  }
}
