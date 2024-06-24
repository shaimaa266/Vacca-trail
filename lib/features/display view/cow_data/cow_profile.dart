import 'package:app_vacca/features/display%20view/activity_system/presentation/view/activity_systems.dart';
import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding_systems.dart';
import 'package:app_vacca/features/display%20view/cow_data/data/model/cows_model.dart';
import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../activity_places/presentation/view/activity_places.dart';

class CowNormal extends StatelessWidget with MyConstants {
  CowNormal(
      {super.key, required this.cowId, required this.cowStatus, this.image});
  final String cowId;
  final int cowStatus;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
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
                        child: CircleAvatar(
                          backgroundImage: image != null && image!.isNotEmpty
                              ? NetworkImage(image!)
                              : const AssetImage('assets/images/cow two.jpg')
                                  as ImageProvider,
                          radius: 100,
                          onBackgroundImageError: (_, __) {
                            const CircularProgressIndicator();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 22, left: 55, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cow ID",
                              style: TextStyle(
                                  fontSize: 44.sp,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  color: titleColor),
                            ),
                            Text(
                              cowId,
                              style: TextStyle(
                                  fontSize: 36.sp,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w600,
                                  color: titleColor),
                            ),
                            Container(
                              width: 220.w,
                              height: 72.h,
                              decoration: BoxDecoration(
                                color: cowStatus == 0
                                    ? containerBorderColor
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: baseColor, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  cowStatus == 0 ? "Normal" : "Abnormal",
                                  style: TextStyle(
                                      fontSize: 33.sp,
                                      fontWeight: FontWeight.w400,
                                      color: containerColor),
                                ),
                              ),
                            ),
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
                    return Center(
                      child: SpinKitFoldingCube(
                        color: Colors.green.shade700,
                        size: 70,
                      ),
                    );
                  } else if (cowProvider.errorMessage != null) {
                    return Center(
                      child: Text(cowProvider.errorMessage!),
                    );
                  } else {
                    final cows = cowProvider.cows.firstWhere(
                      (element) => element.cowId == cowId,
                      orElse: () => CowModel(
                        isPregnant: 0,
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
                        activity_system: [],
                        activity_places: [],
                        breeding_system: [],
                      ),
                    );

                    if (cows.id == 0) {
                      return Center(
                        child: Text('No Cows as $cowId not found'),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 22, bottom: 16, right: 16),
                      child: SizedBox(
                        height: 490.h,
                        child: ListView(
                          children: [
                            getText("Cow Appearance: ${cows.appearance}"),
                            getText("Cow Weight: ${cows.weight}"),
                            getText("Purpose id: ${cows.purpose_id}"),
                            getText("Cow Gender: ${cows.gender}"),

                            getText("Cow Age: ${cows.age}"),
                            RichText(
                              text: TextSpan(
                                text: 'Status:  ',
                                style: TextStyle(
                                    color: const Color(0xff263238),
                                    fontSize: 36.sp,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Urbanist',
                                    fontWeight: FontWeight.w900),
                                children: [
                                  TextSpan(
                                      text: cows.isPregnant == 1
                                          ? 'NotPregnant '
                                          : "Pregnant",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 40.sp,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Urbanist',
                                          fontWeight: FontWeight.w900)),
                                ],
                              ),
                            ),
                            getText(
                                "Day Milk Amount : ${cows.milk_amount_morning}"),
                            getText(
                                "Night Milk Amount: ${cows.milk_amount_afternoon}"),
                            getText("Original Area: ${cows.original_area}"),
                            getText("Cow Longitude : ${cows.longitude}"),
                            getText("Cow Latitude: ${cows.latitude}"),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BreedingSystems(
                                      initialBreedingSystemId: cows.breadingsystem_id,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breeding System id:   ${cows.breadingsystem_id}             ",
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
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ActivitySystems(
                                      initialSystemId: cows.activitysystem_id,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Activity System id:   ${cows.activitysystem_id}             ",
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
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ActivityPlaces(
                                      initialPlaceId: cows.activityplace_id,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Existing place id:   ${cows.activityplace_id}             ",
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
                            getText("Entrance Date: ${cows.entrance_date}"),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}

Widget getText(String text) {
  return Text(
    text,
    style: TextStyle(
        color: const Color(0xff263238),
        fontSize: 36.sp,
        fontFamily: 'Urbanist',
        fontWeight: FontWeight.w900),
  );
}
