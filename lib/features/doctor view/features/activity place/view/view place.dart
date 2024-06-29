import 'package:app_vacca/core/widgets/text%20font%20body.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/first_row_title.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';
import '../../shared/doctor_nav_bar.dart';

class ViewPlace extends StatelessWidget  with MyConstants{
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
        latitude: '',
        longitude: '',
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
                              latitude: '',
                              longitude: '',
                            ),
                          );

                          if (activityPlaces.id == 0) {
                            return Center(
                              child: Text('Place with ID $placeId not found'),
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
                                  child:  activityPlaces.image.isEmpty?Image.asset( 'assets/images/cow.jpg'): Image.network(
                                    activityPlaces.image,
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
                                      text: activityPlaces.type),
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



                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  activityPlaces.goal, style: TextStyle(
                                  fontSize: 33.sp,
                                  fontFamily: 'Urbanist',
                                  color: const Color(0xff263238),
                                  fontWeight: FontWeight.w600,
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  activityPlaces.description,  style: TextStyle(
                                  fontSize: 33.sp,
                                  fontFamily: 'Urbanist',
                                  color: const Color(0xff263238),
                                  fontWeight: FontWeight.w600,
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
                              Padding(
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
                            ]
                          );
                        }
                      },
                    );
                  }
                }),
          ),
        ),
      ),
      bottomNavigationBar:  DoctorNavBar(),
    );
  }
}
