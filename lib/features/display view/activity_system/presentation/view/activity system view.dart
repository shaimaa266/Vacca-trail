import 'package:app_vacca/core/widgets/text font body.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../custom_widgets/constants_mixin.dart';
import '../../data/models/activity_system_model.dart';

class ActivitySystemView extends StatelessWidget with MyConstants {
  final int activitySystemId;
  final String imagePath;
  int i = 0;

  ActivitySystemView(
      {required this.activitySystemId, required this.imagePath, Key? key})
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
          final activitySystem = activitySystemProvider.activitySystems
              .firstWhere((system) => system.id == activitySystemId,
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
                      ));

          if (activitySystem.id == 0) {
            return Center(
              child:
                  Text('Breeding system with ID $activitySystemId not found'),
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
                    imagePath,
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
                            const TextFont(text: "Name : ", height: 40),
                            TextFont(text: activitySystem.name, height: 40),
                          ],
                        ),
                        Row(
                          children: [
                            const TextFont(text: "Id: ", height: 40),
                            TextFont(
                                text: activitySystem.id.toString(), height: 40),
                          ],
                        ),
                        const TextFont(text: "Cause of Creation:", height: 40),
                        TextFont(
                            text: activitySystem.cause_of_creation, height: 80),
                        const TextFont(text: "System Goal:", height: 40),
                        TextFont(text: activitySystem.goal, height: 40),
                        const TextFont(text: "description:", height: 40),
                        TextFont(text: activitySystem.description, height: 80),
                        const TextFont(text: "Existing Cows: ", height: 40),
                        TextFont(
                            text: "${activitySystem.cows.length}", height: 40),
                        const TextFont(text: "Created at:", height: 40),
                        TextFont(text: activitySystem.created_at, height: 40),
                        const TextFont(text: "Updated at:", height: 40),
                        TextFont(text: activitySystem.updated_at, height: 40),
                        if (activitySystem.cows.isNotEmpty)
                          ...activitySystem.cows.map((cow) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFont(
                                    text: "Cow ID: ${cow.cowId}", height: 40),
                                TextFont(
                                    text: "Gender: ${cow.gender}", height: 40),
                                TextFont(text: "Age: ${cow.age}", height: 40),
                                TextFont(
                                    text: "Weight: ${cow.weight}", height: 40),
                                TextFont(
                                    text:
                                        "Milk Amount Morning: ${cow.milk_amount_morning}",
                                    height: 40),
                                TextFont(
                                    text:
                                        "Milk Amount Afternoon: ${cow.milk_amount_afternoon}",
                                    height: 40),
                                TextFont(
                                    text: "Appearance: ${cow.appearance}",
                                    height: 40),
                                TextFont(
                                    text: "Original Area: ${cow.original_area}",
                                    height: 40),
                                TextFont(
                                    text: "Entrance Date: ${cow.entrance_date}",
                                    height: 40),
                                TextFont(
                                    text:
                                        "Location: (${cow.latitude}, ${cow.longitude})",
                                    height: 40),
                                TextFont(
                                    text:
                                        "Status: ${cow.cow_status == 1 ? 'Active' : 'Inactive'}",
                                    height: 40),
                                Image.network(cow.image==''?'':cow.image!,
                                    height: 100, width: 100),
                                const SizedBox(height: 20),
                              ],
                            );
                          }).toList()
                        else
                          const TextFont(
                              text: "No cows with this activity system.",
                              height: 40),
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
}
