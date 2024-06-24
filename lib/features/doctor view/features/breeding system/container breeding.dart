import 'package:app_vacca/features/doctor%20view/features/breeding%20system/view%20system/view_system.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/button_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../display view/breeding_system/data/models/breeding_model.dart';
import '../../../display view/breeding_system/presentation/manage/breeding_provider.dart';

class BreedingContainer extends StatelessWidget {
  BreedingContainer(
      {super.key, required this.breedingSystemId, required this.imagePath});

  final int breedingSystemId;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Consumer<BreedingProvider>(
        builder: (context, breedingProvider, child) {
      if (breedingProvider.isLoading) {
        return Center(
          child: SpinKitFoldingCube(
            color: Colors.green.shade700,
            size: 70,
          ),
        );
      } else if (breedingProvider.errorMessage != null) {
        return Center(
          child: Text(breedingProvider.errorMessage!),
        );
      } else {
        final breeding = breedingProvider.breedingSystems
            .firstWhere((system) => system.id == breedingSystemId,
                orElse: () => BreedingModel(
                      id: 0,
                      name: '',
                      goal: '',
                      cause_of_creation: '',
                      created_at: '',
                      updated_at: '',
                      description: '',
                      cows_count: 0,
                      cows: [],
                    ));

        if (breeding.id == 0) {
          return Center(
            child: Text('Breeding system with ID $breedingSystemId not found'),
          );
        }

        return SizedBox(
          height: 665.h,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 290,
              childAspectRatio: 2 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
            ),
            itemCount: breedingProvider.breedingSystems.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(bottom: 9, left: 12, right: 12),
              child: Container(
                width: 265,
                height: 430,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 6, bottom: 4, left: 6, right: 6),
                      child: SizedBox(
                        width: 265.w,
                        height: 110.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            breedingProvider.images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      breeding.name,
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      breeding.goal,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SaveButton(route:ViewBreedSystem() ,)
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}
