import 'package:app_vacca/core/widgets/text font body.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/constants_mixin.dart';
import '../../data/models/activity_system_model.dart';

class ActivitySystemView extends StatelessWidget with MyConstants {
  final int activitySystemId;
  final String imagePath;

  ActivitySystemView(
      {required this.activitySystemId, required this.imagePath, Key? key})
      : super(key: key);

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
              child:
              Text('Breeding system with ID $activitySystemId not found'),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 600.w,
                  height: 190.h,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TextFont(
                            text: "Name : ",
                            height: 40,
                            isDark: false,
                          ),
                          TextFont(
                            text: activitySystem.name,
                            height: 40,
                            isDark: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const TextFont(
                        text: "Cause of Creation:",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.cause_of_creation,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const TextFont(
                        text: "System activities:",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.activities!,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const TextFont(
                        text: "System Goal:",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.goal,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const TextFont(
                        text: "Description:",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.description,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextFont(
                        text: "sleep time :",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.sleepTime,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const TextFont(
                        text: "wakeup  time :",
                        height: 30,
                        isDark: false,
                      ),
                      Text(
                        activitySystem.wakeUpTime,
                        style: TextStyle(
                          fontSize: 33.sp,
                          fontFamily: 'Urbanist',
                          color: const Color(0xff263238),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          if (activitySystem.cows!.isNotEmpty)
                            DropdownButton<String>(
                              focusColor: Colors.grey[300],
                              items: activitySystem.cows!.map((cow) {
                                return DropdownMenuItem<String>(
                                  value: cow.cowId.toString(),
                                  child: Center(
                                      child: Row(
                                        children: [
                                          Text("Cow ID: ${cow.cowId}"),
                                          const SizedBox(
                                            width: 35,
                                          ),
                                          CircleAvatar(
                                            radius: 3,
                                            backgroundColor: cow.cow_status == 0
                                                ? baseColor
                                                : Colors.red,
                                          )
                                        ],
                                      )),
                                );
                              }).toList(),
                              onChanged: (val) {},
                              hint: TextFont(
                                text:
                                "Applied on : ${activitySystem.cows!.length} cows        ",
                                height: 30,
                                isDark: true,
                              ),
                            )
                          else
                            const TextFont(
                              text: "No cows in this place.",
                              height: 40,
                              isDark: true,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

