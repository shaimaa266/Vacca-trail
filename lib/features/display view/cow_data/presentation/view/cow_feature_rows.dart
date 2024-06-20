import 'package:app_vacca/features/display%20view/cow_data/cow_profile.dart';
import 'package:app_vacca/features/display%20view/cow_data/data/model/cows_model.dart';
import 'package:app_vacca/features/display%20view/cow_data/presentation/control/cow_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class CowFeatureRows extends StatelessWidget with MyConstants {
  CowFeatureRows({super.key, required this.cowId});

  final String cowId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
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
          } else {
            final cows = cowProvider.cows.firstWhere(
                  (element) => element.cowId == cowId,
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
                activity_system: [],
                activity_places: [],
                breeding_system: [],
                isPregnant: 0,
              ),
            );

            if (cows.id == 0) {
              return Center(
                child: Text('No Cows as $cowId not found'),
              );
            }

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CowNormal(
                      cowId: cows.cowId!,
                      cowStatus: cows.cow_status!,
                      image: cows.image,
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(cows.image!),
                      onBackgroundImageError: (exception, stackTrace) {
                        // Handle image loading error
                      },
                      child: cows.image!.isEmpty
                          ? Icon(Icons.error) // Placeholder icon in case of an error
                          : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 16.0),
                    child: Text(
                      "  Cow ID",
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 44.sp,
                        fontFamily: 'Urbanist',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 33, right: 16),
                    child: Text(
                      cows.cowId!,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 40.sp,
                        fontFamily: 'Urbanist',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


