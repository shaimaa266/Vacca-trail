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

  ActivityPlacesView(
      {required this.placeId, required this.imageUrl, super.key});

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
          final activityPlaces = placeProvider.allActivityPlaces.firstWhere(
            (system) => system.id == placeId,
            orElse: () => ActivityPlacesModel(
              id: 0,
              name: '',
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

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Image.network(
                          activityPlaces.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    TextFont(text: "Id: ${activityPlaces.id}", height: 30,isDark: true,),
                    TextFont(height: 30,isDark: true, text: 'name : ${activityPlaces.name}'),
                    TextFont(
                        height: 30,isDark: true,
                        text: 'Place Capacity : ${activityPlaces.capacity}'),
                    TextFont(
                        height: 30,isDark: true,
                        text: 'Place Type  :${activityPlaces.type}'),
                    const          TextFont(text: "System Goal:", height: 30,isDark: false,),
                    TextFont(text: activityPlaces.goal!, height: 80,isDark: true,),
                    const TextFont(text: "description:", height: 30,isDark: false,),
                    TextFont(text: activityPlaces.description!, height: 80,isDark: true,),
                    const TextFont(text: "Place location :", height: 30,isDark: false,),
                    Row(
                      children: [
                        TextFont(
                            text: "latitude:  ${activityPlaces.latitude}  ,",
                            height: 30,isDark: true,),
                        TextFont(
                            text: "  longitude:  ${activityPlaces.longitude}",
                            height: 30,isDark: true,),
                      ],
                    ),
                    Row(
                      children: [

                        if (activityPlaces.cows!.isNotEmpty)
                          DropdownButton<String>(
                            focusColor:Colors.grey[300],
                            items: activityPlaces.cows!.map((cow) {
                              return DropdownMenuItem<String>(
                                value: cow.cowId.toString(),
                                child: Center(child: Text("Cow ID: ${cow.cowId}")),
                              );
                            }).toList(),
                            onChanged: (val) {},
                            hint:   TextFont(
                              text:
                              "Applied on : ${activityPlaces.cows!.length} cows        ",
                              height: 30,isDark: true,) ,
                          )
                        else
                          const TextFont(
                            text: "No cows in this place.", height: 40,isDark: true,),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
