import 'package:app_vacca/core/widgets/text%20font%20body.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';
import '../../shared/button_customized.dart';
import '../../shared/button_save.dart';
import '../../shared/containerInfo.dart';
import '../../shared/containerRowInfo.dart';
import 'edit place.dart';
class ViewPlace extends StatelessWidget {
  final int placeId;
  ViewPlace({super.key, required this.placeId});

  Future<ActivityPlacesModel?> fetchActivityPlace(BuildContext context) async {
    final placeProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    await placeProvider.fetchAllActivityPlaces();
    return placeProvider.allActivityPlaces.firstWhere(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: FutureBuilder<ActivityPlacesModel?>(
                future: fetchActivityPlace(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitHourGlass(
                        color: Colors.green.shade700,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.id == 0) {
                    return Center(
                      child: Text('Place with ID $placeId not found'),
                    );
                  } else {
                    final activityPlace = snapshot.data!;
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
                              child: Text('Place with ID $placeId not found'),
                            );
                          }

                          return Column(
                            children: [
                              TitleRow(textTitle: activityPlace.name!),
                              SizedBox(height: 10.h),
                              containerInfo(
                                cText: 'Place Goals: ',
                                dataText: activityPlace.goal!,
                                h: 80,
                              ),
                              containerInfo(
                                cText: 'Cause of creation: ',
                                dataText: activityPlace.description!,
                                h: 80,
                              ),
                              containerInfo(
                                cText: 'Place Type: ',
                                dataText: activityPlace.type!,
                                h: 40,
                              ),
                              containerRowInfo(
                                cText: 'Capacity of the place: ',
                                dataText: '${activityPlace.capacity} cows',
                              ),
                              containerRowInfo(
                                cText: 'Number of actual cows:',
                                dataText: '${activityPlace.cowCount} cows',
                              ),
                              Row(
                                children: [
                                  if (activityPlace.cows!.isNotEmpty)
                                    DropdownButton<String>(
                                      focusColor: Colors.grey[300],
                                      items: activityPlace.cows!.map((cow) {
                                        return DropdownMenuItem<String>(
                                          value: cow.cowId.toString(),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Text("Cow ID: ${cow.cowId}"),
                                                const SizedBox(width: 35),
                                                CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: cow.cow_status == 0 ? const Color(0xff185C30) : Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                      hint: TextFont(
                                        text: "Applied on: ${activityPlace.cows!.length} cows",
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
                              SaveButton(route: EditPlace(placeId: activityPlace.id,),),
                            ],
                          );
                        }
                      },
                    );
                  }
                }),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
