import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';
import '../../shared/button_customized.dart';
import '../../shared/title.dart';
import 'edit place.dart';
class ViewPlace extends StatelessWidget {
  final int? placeId;

  ViewPlace({super.key, this.placeId});

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
                    child: Text('Breeding system with ID $placeId not found'),
                  );
                } else {
                  final activityPlace = snapshot.data!;
                  final placeProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);

                  return Column(
                    children: [
                     const  MyTitle(text: 'view place'),
                      SizedBox(height: 10.h),
                      InfoContainer(
                        title:'place Purpose',
                        items: [
                          placeProvider.purposeSysController.text,


                        ],
                      ),
                      SizedBox(height: 10.h),
                      InfoContainer(
                        title: placeProvider.causeCreateController.text,
                        items: [
                          placeProvider.causeCreateController.text,

                        ],
                      ),
                      SizedBox(height: 10.h),
                      InfoContainer(
                        title: "System Description",
                        items: [

                        ],
                      ),
                      InfoContainer(
                        title: "Applied on (no of cows)",
                        items: [
                          placeProvider.applyDuaController.text,
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
                        child: Container(
                          width: 350,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xff89A492), width: 1.2),
                          ),
                          child: DropdownButton(
                            focusColor: const Color(0xff44885C),
                            hint: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Applied on ",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            isExpanded: true,
                            iconSize: 40.0,
                            style: const TextStyle(
                              color: Color(0xff44885C),
                            ),
                            items: ['000', '001', '002', '003', '004', '005', '006'].map((val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            }).toList(),
                            onChanged: (val) {
                              // Handle dropdown change
                            },
                          ),
                        ),
                      ),
                      AddButton(
                        onPressed: () {
                          // Navigate to EditPlace with the selected place ID
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EditPlace(initialPlaceId: placeProvider.allActivityPlaces.id),
                            ),
                          );*/
                        },
                        text: "edit the system",
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}

class InfoContainer extends StatelessWidget {
  final String title;
  final List<String> items;

  InfoContainer({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 580.w,
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0xff89A492), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 33.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            for (var item in items)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

