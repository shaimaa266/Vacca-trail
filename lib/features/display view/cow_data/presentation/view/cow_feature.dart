import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'cow_feature_rows.dart';

class CowFeature extends StatelessWidget with MyConstants {
  CowFeature({super.key});
  double? minRange;
  double? maxRange;
  int? selectedCowStatus;

  Future<void> fetchInitialData(BuildContext context) async {
    final cowProvider = Provider.of<CowProvider>(context, listen: false);
    await cowProvider.fetchAllCows();
  }

  void applyAgeFilter(double min, double max, CowProvider cowProvider) {
    minRange = min;
    maxRange = max;
    cowProvider.fetchCows(cowProvider.controller.text, selectedCowStatus, minRange, maxRange);
  }

  void clearFilters(CowProvider cowProvider) {
    selectedCowStatus = null;
    cowProvider.controller.clear();
    cowProvider.fetchAllCows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: fetchInitialData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SpinKitWanderingCubes(
                color: baseColor,
                size: 50,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return BackGreoundImageContainer(
              child: Consumer<CowProvider>(
                builder: (context, cowProvider, child) {
                  if (cowProvider.isLoading) {
                    return Center(
                      child: SpinKitWanderingCubes(
                        color: baseColor,
                        size: 50,
                      ),
                    );
                  } else if (cowProvider.errorMessage != null) {
                    return Center(
                      child: Text(cowProvider.errorMessage!),
                    );
                  }
                  return SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              SizedBox(width: 140.h),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  "Cows",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 43.sp,
                                    color: titleColor,
                                  ),
                                ),
                              ),
                             /* PopupMenuButton<int>(
                                icon: Image.asset('assets/images/sort icon.png'),
                                onCanceled: () {
                                  clearFilters(cowProvider);
                                },
                                onSelected: (int value) {
                                  if (value == 1) {
                                    applyAgeFilter(3, 6, cowProvider);
                                  }
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: () => applyAgeFilter(3, 6, cowProvider),  // Use arrow function for conciseness
                                          child: const Text(
                                            'by cow Age',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => clearFilters(cowProvider),  // Use arrow function for conciseness
                                          icon: const Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),*/

                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cowProvider.cows.length,
                            itemBuilder: (BuildContext context, index) {
                              final cows = cowProvider.cows[index];
                              return SizedBox(
                                height: 140.h,
                                child: CowFeatureRows(cowId: cows.cowId!),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}

