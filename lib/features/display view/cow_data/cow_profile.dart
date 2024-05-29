import 'package:app_vacca/features/display%20view/cow_data/data/model/cows_model.dart';
import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/first_row_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CowNormal extends StatelessWidget with MyConstants {
  CowNormal(
      {Key? key, required this.cowId, required this.cowStatus, this.image})
      : super(key: key);
  final String cowId;
  final int cowStatus;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TitleRow(textTitle: "Cow Profile"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, left: 16, top: 22),
              child: SizedBox(
                height: 170.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 270.w,
                      height: 200.h,
                      child:
                          CircleAvatar(backgroundImage: NetworkImage(image!)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 22, left: 55, right: 30),
                      child: Column(
                        children: [
                          Text(
                            "Cow ID",
                            style: TextStyle(
                                fontSize: 44.sp,
                                fontFamily: 'Urbaniat',
                                fontWeight: FontWeight.w600,
                                color: titleColor),
                          ),
                          Text(
                            cowId,
                            style: TextStyle(
                                fontSize: 36.sp,
                                fontFamily: 'Urbaniat',
                                fontWeight: FontWeight.w600,
                                color: titleColor),
                          ),
                          Container(
                            width: 220.w,
                            height: 72.h,
                            decoration: BoxDecoration(
                                color: cowStatus == 1
                                    ? containerBorderColor
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: baseColor, width: 2)),
                            child: Center(
                                child: Text(
                              cowStatus == 0 ? "Ubnormal" : " Normal",
                              style: TextStyle(
                                  fontSize: 33.sp,
                                  fontWeight: FontWeight.w400,
                                  color: containerColor),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Consumer<CowProvider>(
              builder: (context, cowProvider, child) {
                if (cowProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (cowProvider.errorMessage != null) {
                  return Center(
                    child: Text(cowProvider.errorMessage!),
                  );
                } else {
                  final cows = cowProvider.cows
                      .firstWhere((element) => element.cowId == cowId,
                          orElse: () => CowModel(
                                id: 0,
                                cowId: '',
                                activityplace_id: 0,
                                activitysystem_id: 0,
                                breadingsystem_id: 0,
                                purpose_id: 0,
                                original_area: '',
                                appearance: '',
                                image: '',
                                gender: '',
                                entrance_date: '',
                                age: 0,
                                weight: '',
                                milk_amount_morning: '',
                                milk_amount_afternoon: '',
                                latitude: '',
                                longitude: '',
                                cow_status: 0,
                                updated_at: '',
                                created_at: '',
                              ));

                  if (cows.id == 0) {
                    return Center(
                      child: Text('No Cows as $cowId not found'),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 22, bottom: 16, right: 16),
                    child: SizedBox(
                      height: 477.h,
                      child: ListView(children: [
                        Text(
                          "Cow Appearance: ${cows.appearance}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Weight: ${cows.weight}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Purpose id: ${cows.purpose_id}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Gender: ${cows.gender}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Entrance Date: ${cows.entrance_date}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Age: ${cows.age}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Activity system id : ${cows.activitysystem_id}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Activity place id: ${cows.activityplace_id}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Breeding System id : ${cows.breadingsystem_id}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Weight: ${cows.weight}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Day Milk Amount : ${cows.milk_amount_morning}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Night Milk Amount: ${cows.milk_amount_afternoon}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Original Area: ${cows.original_area}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Longitude : ${cows.longitude}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Cow Latitude: ${cows.latitude}",
                          style: TextStyle(
                              color: titleColor,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
