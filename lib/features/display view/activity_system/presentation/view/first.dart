
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../custom_widgets/constants_mixin.dart';
import '../../data/models/activity_system_model.dart';

class ActivitySystemView extends StatelessWidget with MyConstants {
  final int activitySystemId;
  final String imagePath;
  int i=0;


  ActivitySystemView({required this.activitySystemId, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivitySystemsProvider>(
      builder: (context, activitySystemProvider, child) {
        if (activitySystemProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (activitySystemProvider.errorMessage != null) {
          return Center(
            child: Text(activitySystemProvider.errorMessage!),
          );
        } else {
          final activitySystem = activitySystemProvider.activitySystems.firstWhere(
                  (system) => system.id == activitySystemId,
              orElse: () =>  ActivitySystemModel(
                id: 0,
                name: '',
                goal: '',
                cause_of_creation: '',
                created_at: '',
                updated_at: '',
                description: '',
                cows_count: 0, cows: [

              ],

              ));

          if (activitySystem.id == 0) {
            return Center(
              child: Text('Breeding system with ID $activitySystemId not found'),
            );
          }

          return Column(
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
                    imagePath ,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            getText(text: "Name : ", height: 40),
                            getText(text:  activitySystem.name, height: 40),
                          ],
                        ),
                        Row(
                          children: [
                            getText(text: "Id: ", height: 40),
                            getText(text:  activitySystem.id.toString(), height: 40),
                          ],
                        ),
                        getText(text: "Cause of Creation:", height: 40),
                        getText(text: activitySystem.cause_of_creation, height: 80),
                        getText(text: "System Goal:", height: 40),
                        getText(text: activitySystem.goal, height: 40),
                        getText(text: "description:", height: 40),
                        getText(text: activitySystem.description, height: 80),
                        getText(text: "Existing Cows: ", height: 40),
                        getText(text: "${activitySystem.cows.length}", height: 40),

                        getText(text: "Created at:", height: 40),
                        getText(text: activitySystem.created_at, height: 40),
                        getText(text: "Updated at:", height: 40),
                        getText(text: activitySystem.updated_at, height: 40),
                        if (activitySystem.cows.isNotEmpty)
                          ...activitySystem.cows.map((cow) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getText(text: "Cow ID: ${cow.cowId}", height: 40),
                                getText(text: "Gender: ${cow.gender}", height: 40),
                                getText(text: "Age: ${cow.age}", height: 40),
                                getText(text: "Weight: ${cow.weight}", height: 40),
                                getText(text: "Milk Amount Morning: ${cow.milk_amount_morning}", height: 40),
                                getText(text: "Milk Amount Afternoon: ${cow.milk_amount_afternoon}", height: 40),
                                getText(text: "Appearance: ${cow.appearance}", height: 40),
                                getText(text: "Original Area: ${cow.original_area}", height: 40),
                                getText(text: "Entrance Date: ${cow.entrance_date}", height: 40),
                                getText(text: "Location: (${cow.latitude}, ${cow.longitude})", height: 40),
                                getText(text: "Status: ${cow.cow_status == 1 ? 'Active' : 'Inactive'}", height: 40),
                                Image.network(cow.image, height: 100, width: 100),
                                SizedBox(height: 20),
                              ],
                            );
                          }).toList()
                        else
                          getText(text: "No cows with this activity system.", height: 40),
                      ],

                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget getText({required String text, required double height}) {
    return SizedBox(
      height: height,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 33.sp,
          color: const Color(0xff263238),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}