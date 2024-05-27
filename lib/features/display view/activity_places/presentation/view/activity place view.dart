import 'package:app_vacca/core/widgets/text font body.dart';
import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widgets/constants_mixin.dart';
import '../control/activity_place_provider.dart';

class ActivityPlacesView extends StatelessWidget with MyConstants {
  final int placeId;
  final String imageUrl;

  ActivityPlacesView({required this.placeId, required this.imageUrl, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityPlaceProvider>(
      builder: (context, placeProvider, child) {
        if (placeProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (placeProvider.errorMessage != null) {
          return Center(
            child: Text(placeProvider.errorMessage!),
          );
        } else {
          final activityPlaces = placeProvider.activityPlaces.firstWhere(
            (system) => system.id == placeId,
            orElse: () => ActivityPlacesModel(
              id: 0,
              goal: '',
              description: '',
              cows: [],
              image: '',
              activitySystemId: 0,
              updatedAt: '',
              createdAt: '',
              type: '',
              capacity: 0,
              cowCount: 0,
              latitude: null,
              longitude: null,
            ),
          );

          if (activityPlaces.id == 0) {
            return Center(
              child: Text('Breeding system with ID $placeId not found'),
            );
          }

          return Column(
            children: [
              if (imageUrl.isNotEmpty)
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
                      imageUrl,
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
                        TextFont(text: "Id: ${activityPlaces.id}", height: 30),
                        const TextFont(text: "System Goal:", height: 30),
                        TextFont(text: activityPlaces.goal, height: 80),
                        const TextFont(text: "description:", height: 30),
                        TextFont(text: activityPlaces.description, height: 80),
                        TextFont(
                            text: "latitude:  ${activityPlaces.latitude}",
                            height: 30),
                        TextFont(
                            text: "longitude:  ${activityPlaces.longitude}",
                            height: 30),
                        TextFont(
                            height: 30, text: ' Type :${activityPlaces.type}'),
                        TextFont(
                            text:
                                "Number of cows: ${activityPlaces.cows.length} ",
                            height: 40),
                        if (activityPlaces.cows.isNotEmpty)
                          ...activityPlaces.cows.map((cow) {
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
                                        "Status: ${cow.cow_status == 1 ? 'Inactive ' : 'Active'}",
                                    height: 40),
                                Image.network(cow.image,
                                    height: 100, width: 100),
                                const SizedBox(height: 20),
                              ],
                            );
                          }).toList()
                        else
                          const TextFont(
                              text: "No cows in this place.",
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
