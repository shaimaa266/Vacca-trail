import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/doctor_nav_bar.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/control/treatment_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/today_treatment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/widgets/first_row_title.dart';
import '../../../../../../core/widgets/search_bar.dart';
import 'last_treatment.dart';

class AllTreatments extends StatelessWidget {
  final int id;
  AllTreatments({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    final treatmentProvider =
        Provider.of<TreatmentProvider>(context, listen: false);
    return FutureBuilder(
        future: treatmentProvider.fetchAllTreatments(id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitHourGlass(
                color: Colors.green.shade700,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Consumer<TreatmentProvider>(
                builder: (context, treatProvider, child) {
              if (treatProvider.errorMessage != null) {
                return Center(
                  child: Text(treatProvider.errorMessage!),
                );
              } else {
                final todayTreatments =
                    treatProvider.allTreatments.take(6).toList();
                final yesterdayTreatments =
                    treatProvider.allTreatments.skip(6).take(4).toList();

                return BackGreoundImageContainer(
                  child: Scaffold(
                    body: yesterdayTreatments.isNotEmpty
                        ? SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleRow(textTitle: " Treatments"),
                                Row(
                                  children: [
                                    SearchBarCustom(
                                      controller:
                                          treatProvider.searchController,
                                      onTap: () {},
                                      onPressedSearch: () {},
                                      w: 640,
                                      h: 50,
                                      keyboardType: TextInputType.text,
                                      hintText: "Search your treatments",
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Today",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 350.h,
                                  width: 680.w,
                                  child: ListView.builder(
                                    itemCount: todayTreatments.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final todayTreat = todayTreatments[index];
                                      return TodayTreatment(
                                          treatmentModel: todayTreat);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "Yesterday",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 220.h,
                                  width: 680.w,
                                  child: ListView.builder(
                                    itemCount: yesterdayTreatments.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final lastTreat =
                                          yesterdayTreatments[index];
                                      return LastTreatment(
                                        treatmentModel: lastTreat,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SafeArea(
                            child: BackGreoundImageContainer(
                              child: Column(
                                children: [
                                  TitleRow(textTitle: "Treatments"),
                                  Row(
                                    children: [
                                      SearchBarCustom(
                                        controller:
                                            treatProvider.searchController,
                                        onTap: () {},
                                        onPressedSearch: () {},
                                        w: 630,
                                        h: 50,
                                        keyboardType: TextInputType.text,
                                        hintText:"Search your treatments",
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Today",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 550.h,
                                    width: 680.w,
                                    child: ListView.builder(
                                      itemCount: todayTreatments.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final todayTreat =
                                            todayTreatments[index];
                                        return TodayTreatment(
                                            treatmentModel: todayTreat);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    bottomNavigationBar: DoctorNavBar(),
                  ),
                );
              }
            });
          }
        });
  }
}
