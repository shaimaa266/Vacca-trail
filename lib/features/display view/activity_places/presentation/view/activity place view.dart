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
              child: Text('place with ID $placeId not found'),
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
                    Row(
                      children: [
                        const TextFont(
                          text: "Id: ",
                          height: 30,
                          isDark: false,
                        ),
                        TextFont(
                          text: " ${activityPlaces.id}",
                          height: 30,
                          isDark: true,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const TextFont(
                            height: 30, isDark: false, text: 'name : '),
                        TextFont(
                            height: 30,
                            isDark: true,
                            text: ' ${activityPlaces.name}'),
                      ],
                    ),
                    Row(
                      children: [
                        const TextFont(
                            height: 30,
                            isDark: false,
                            text: 'Place Capacity : '),
                        TextFont(
                            height: 30,
                            isDark: true,
                            text: ' ${activityPlaces.capacity}'),
                      ],
                    ),
                    Row(
                      children: [
                        const TextFont(
                            height: 30, isDark: false, text: 'Place Type  :'),
                        TextFont(
                            height: 30,
                            isDark: true,
                            text: '${activityPlaces.type}'),
                      ],
                    ),
                    const TextFont(
                      text: "System Goal:",
                      height: 30,
                      isDark: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFont(
                          text: activityPlaces.goal!,
                          height: 80,
                          isDark: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFont(
                      text: "description :",
                      height: 30,
                      isDark: false,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white10,
                            width: 1,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFont(
                          text: activityPlaces.description!,
                          height: 80,
                          isDark: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFont(
                      text: "Place location :",
                      height: 30,
                      isDark: false,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white10,
                            width: 1,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            TextFont(
                              text: "latitude:  ${activityPlaces.latitude}  ,",
                              height: 30,
                              isDark: true,
                            ),
                            TextFont(
                              text: "  longitude:  ${activityPlaces.longitude}",
                              height: 30,
                              isDark: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        if (activityPlaces.cows!.isNotEmpty)
                          DropdownButton<String>(
                            focusColor: Colors.grey[300],
                            items: activityPlaces.cows!.map((cow) {
                              return DropdownMenuItem<String>(
                                value: cow.cowId.toString(),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Text("Cow ID: ${cow.cowId}"),
                                    const SizedBox(width: 35,),
                                    CircleAvatar(
                                      radius: 3,
                                      backgroundColor: cow.cow_status == 0
                                          ? baseColor
                                          : Colors.red,
                                    ),
                                  ],
                                )),
                              );
                            }).toList(),
                            onChanged: (val) {},
                            hint: TextFont(
                              text:
                                  "Applied on : ${activityPlaces.cows!.length} cows        ",
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
            ),
          );
        }
      },
    );
  }
}
