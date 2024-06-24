import 'package:app_vacca/features/display%20view/activity_places/presentation/control/activity_place_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20place/view/view%20place.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/containerRowInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/text font body.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/custom_widgets/constants_mixin.dart';
import '../../../../../core/widgets/first_row_title.dart';
import '../../shared/button_customized.dart';
import '../../shared/custom_sys_field.dart';

class EditPlace extends StatelessWidget with MyConstants {
  final int placeId;

  EditPlace({super.key, required this.placeId});

  Future<ActivityPlacesModel?> fetchActivityPlace(BuildContext context) async {
    final placeProvider =
        Provider.of<ActivityPlaceProvider>(context, listen: false);
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
                    child: Text('place with ID $placeId not found'),
                  );
                } else {
                  return Consumer<ActivityPlaceProvider>(
                      builder: (context, placeProvider, child) {
                    if (placeProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (placeProvider.errorMessage != null) {
                      return Center(
                        child: Text(placeProvider.errorMessage!),
                      );
                    } else {
                      final activityPlaces =
                          placeProvider.allActivityPlaces.firstWhere(
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
                          child: Text(
                              'Breeding system with ID $placeId not found'),
                        );
                      }
                      return Column(
                        children: [
                          TitleRow(textTitle: "Edit Place Info"),
                          SizedBox(height: 10.h),
                          CustomSysField(
                              controller: placeProvider.nameSysController,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              readOnly: false,
                              text: activityPlaces.name!,
                              height: 50,
                              isWhite: true,
                              width: 300,
                              withBorder: true,
                              colorHex: titleColor),
                          CustomSysField(
                              controller: placeProvider.purposeSysController,
                              maxLines: 30,
                              keyboardType: TextInputType.text,
                              readOnly: false,
                              text: activityPlaces.goal!,
                              height: 80,
                              isWhite: true,
                              width: 300,
                              withBorder: true,
                              colorHex: titleColor),
                          CustomSysField(
                              controller: placeProvider.sysInfoController,
                              maxLines: 30,
                              keyboardType: TextInputType.text,
                              readOnly: false,
                              text: activityPlaces.description!,
                              height: 80,
                              isWhite: true,
                              width: 300,
                              withBorder: true,
                              colorHex: titleColor),
                          CustomSysField(
                              controller: placeProvider.typeController,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              readOnly: false,
                              text: activityPlaces.type!,
                              height: 50,
                              isWhite: true,
                              width: 300,
                              withBorder: true,
                              colorHex: titleColor),
                          //activity system name...
                          containerRowInfo(
                              cText: 'Capacity of the place',
                              dataText: '${activityPlaces.capacity}'),
                          containerRowInfo(
                              cText: 'actual cow count ',
                              dataText: '${activityPlaces.cowCount}'),

                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: containerColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: containerBorderColor),
                            ),
                            child: Row(
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
                                            const SizedBox(
                                              width: 35,
                                            ),
                                            CircleAvatar(
                                              radius: 3,
                                              backgroundColor:
                                                  cow.cow_status == 0
                                                      ? const Color(0xff185C30)
                                                      : Colors.red,
                                            ),
                                          ],
                                        )),
                                      );
                                    }).toList(),
                                    onChanged: (val) {},
                                    hint: const TextFont(
                                      text: "Applied on :        ",
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
                          ),
                          AddButton(text: 'Save', onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title:const   Center(child: Text('Are you sure?')),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                    placeProvider.changePlaceInfo(activityPlaces.id);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>  ViewPlace(placeId: placeId,),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // Close the dialog
                                        },
                                        child: const Text(
                                          'No',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        ],
                      );
                    }
                  });
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
