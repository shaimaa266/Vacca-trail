import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20system/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../display view/activity_system/data/models/activity_system_model.dart';
import '../../../display view/activity_system/presentation/control/activity_system_provider.dart';

class ActivitySysContainer extends StatelessWidget with MyConstants {
  ActivitySysContainer(
      {super.key, required this.activitySystemId, required this.imagePath});
  final int activitySystemId;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Consumer<ActivitySystemsProvider>(
        builder: (context, activitySystemProvider, child) {
      if (activitySystemProvider.isLoading) {
        return Center(
          child: SpinKitWanderingCubes(
            color: baseColor,
            size: 50,
          ),
        );
      } else if (activitySystemProvider.errorMessage != null) {
        return Center(
          child: Text(activitySystemProvider.errorMessage!),
        );
      } else {
        final activitySystem =
            activitySystemProvider.activitySystems.firstWhere(
          (system) => system.id == activitySystemId,
          orElse: () => ActivitySystemModel(
            id: 0,
            name: '',
            goal: '',
            cause_of_creation: '',
            created_at: '',
            updated_at: '',
            description: '',
            cows_count: 0,
            cows: [],
            wakeUpTime: '',
            sleepTime: '',
            breedingId: 0,
            activities: '',
          ),
        );

        if (activitySystem.id == 0) {
          return Center(
            child: Text('activity system with ID $activitySystemId not found'),
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
            itemCount: activitySystemProvider.filteredSystems.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.only(bottom: 9, left: 12, right: 12),
              child: Container(
                width: 260,
                height: 380,
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
                            activitySystemProvider
                                .images[activitySystemProvider.currentPage],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      activitySystem.name,
                      style: TextStyle(fontSize: 22.sp, color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      activitySystem.goal,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Center(
                      child: Container(
                        width: 245.w,
                        height: 22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff44885C)),
                        child: MaterialButton(
                          child: const Text(
                            "view more",
                            style: TextStyle(
                                color: Color(0xffEAEEEC),
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ViewActSystem(activitySystemModel: activitySystem,),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
