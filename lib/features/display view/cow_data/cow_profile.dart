import 'package:app_vacca/core/widgets/text%20font%20body.dart';
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
                          top: 20, left: 29, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 500.h,
                            child: ListView(
                              children: [
                                getText("Cow Appearance: ${cows.appearance}"),
                                getText("Cow Weight: ${cows.weight} kg "),
                                getText("Cow Gender: ${cows.gender}"),
                                getText("Cow Age: ${cows.age!>6?7:5} years"),
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
                                    "Day Milk Amount : ${cows.milk_amount_morning} kg"),
                                getText(
                                    "Night Milk Amount: ${cows.milk_amount_afternoon} kg "),
                                getText("Original Area: ${cows.original_area}"),
                                getText("Cow location  Longitude : ${cows.longitude}"),
                                getText("Cow location  Latitude: ${cows.latitude}"),
                                ListTile(
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
                                  leading: getText('view activity place '),
                                  title: Text(''),
                                  trailing:  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                ListTile(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ActivityPlaces(
                                          initialPlaceId: cows.breadingsystem_id,
                                        ),
                                      ),
                                    );
                                  },
                                leading: getText(

                                  '  applied breeding system ',
                                  ),
                                  title: Text(''),
                                  trailing: const  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25,
                                    color: Colors.black
                                  ),
                                ),

                                ListTile(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ActivityPlaces(
                                          initialPlaceId: cows.activitysystem_id,
                                        ),
                                      ),
                                    );
                                  },
                                  leading:  getText(
                                   ' applied activity system ',
                                  ),
                                  title: Text(''),
                                  trailing: const  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                getText("Entrance Date and time : "),
                                getText('${cows.entrance_date}'),
                              ],
                            ),
                          ),
                        ],
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
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w900),
  );
}
