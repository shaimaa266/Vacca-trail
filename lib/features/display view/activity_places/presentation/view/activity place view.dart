
import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../custom_widgets/constants_mixin.dart';
import '../control/activity_place_provider.dart';

class ActivityPlacesView extends StatelessWidget with MyConstants {
  final int activityPlaceId;
  final String imagePath;
  int i=0;


  ActivityPlacesView({required this.activityPlaceId, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActivityPlacesProvider>(
      builder: (context, activityPlacesProvider, child) {
        if (activityPlacesProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (activityPlacesProvider.errorMessage != null) {
          return Center(
            child: Text(activityPlacesProvider.errorMessage!),
          );
        } else {
          final activityPlace = activityPlacesProvider.activityPlaces.firstWhere(
                  (system) => system.id == activityPlaceId,
              orElse: () => ActivityPlacesModel(
                id: 0,

                goal: '',

                description: '',
                cows: [

              ], image: '', activitySystemId: 0, updatedAt: '', createdAt: '', type: '', capacity: 0, cowCount: 0, latitude: '', longitude: '',

              ));

          if (activityPlace.id == 0) {
            return Center(
              child: Text('Breeding system with ID $activityPlaceId not found'),
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
                            getText(text: "Id: ", height: 40),
                            getText(text: activityPlace.id.toString(), height: 40),
                          ],
                        ),
                        getText(text: " Place Description:", height: 40),
                        getText(text: activityPlace.description, height: 80),
                        getText(text: "Place Goal:", height: 40),
                        getText(text: activityPlace.goal, height: 40),
                        getText(text: "Place Capacity:", height: 40),
                        getText(text: "${activityPlace.capacity}", height: 80),
                        getText(text: "Existing Cows: ", height: 40),
                        getText(text: "${activityPlace.cows.length}", height: 40),

                        getText(text: "Created at:", height: 40),
                        getText(text: activityPlace.createdAt, height: 40),
                        getText(text: "Updated at:", height: 40),
                        getText(text: activityPlace.updatedAt, height: 40),

                        getText(text: "Place Location :", height: 40),
                        Row(
                          children: [
                            getText(text: activityPlace.longitude, height: 40),
                            getText(text: activityPlace.latitude, height: 40),
                          ],
                        ),

                        if (activityPlace.cows.isNotEmpty)
                          ...activityPlace.cows.map((cow) {
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
                          getText(text: "No cows in this place.", height: 40),
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


