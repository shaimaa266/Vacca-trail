import 'package:app_vacca/features/display%20view/activity_places/presentation/control/activity_place_provider.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20place/view/view%20place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../shared/button_customized.dart';
import '../../shared/custom_sys_field.dart';
import '../../shared/title.dart';

class EditPlace extends StatefulWidget {
  EditPlace({super.key,  required this.initialPlaceId});
  final int initialPlaceId;

  @override
  State<EditPlace> createState() => _EditSystemState();
}

class _EditSystemState extends State<EditPlace> {

  String? selectedCowId;
  int? placeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            child: Consumer<ActivityPlaceProvider>(
              builder: (context, placeProvider, child) {
                if (placeProvider.isLoading) {
                  return Center(
                    child: SpinKitHourGlass(
                      color: Colors.green.shade700,
                    ),
                  );
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
                      child: Text('Breeding system with ID $placeId not found'),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const MyTitle(text: "Edit a Place"),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomSysField(
                          withBorder: true,
                          isWhite: true,
                          colorHex: const Color(0xff263238),
                          height: 50,
                          width: 580,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          maxLines: 2,
                          controller: placeProvider.nameSysController,
                          text: activityPlaces.name!,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomSysField(
                          withBorder: true,
                          isWhite: true,
                          colorHex: const Color(0xff263238),
                          height: 100,
                          width: 580,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          maxLines: 20,
                          controller: placeProvider.purposeSysController,
                          text: activityPlaces.goal!,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomSysField(
                          withBorder: true,
                          isWhite: true,
                          colorHex: const Color(0xff263238),
                          height: 140,
                          width: 580,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          maxLines: 20,
                          controller: placeProvider.sysInfoController,
                          text: activityPlaces.description!,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 340,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xff89A492), width: 1),
                            color: Colors.white,
                          ),
                          child: Text(
                            " Capacity of place ${activityPlaces.capacity} cows ",
                            style: TextStyle(
                              color: const Color(0xff777E82),
                              fontWeight: FontWeight.w500,
                              fontSize: 31.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            width: 340,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border: Border.all(
                                  color: const Color(0xff89A492), width: 1),
                              color: Colors.white,
                            ),
                            child: Text(
                              " Number of actual cows in place  ${activityPlaces.cowCount} cows ",
                              style: TextStyle(
                                color: const Color(0xff777E82),
                                fontWeight: FontWeight.w500,
                                fontSize: 29.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomSysField(
                        withBorder: true,
                        isWhite: true,
                        height: 50,
                        width: 580,
                        readOnly: false,
                        colorHex: const Color(0xff263238),
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        controller: placeProvider.applyDuaController,
                        text: "Apply on (${activityPlaces.cows!.length} cows) ",
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 8, right: 8, bottom: 16),
                        child: Container(
                          width: 340,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xff89A492), width: 1.2),
                          ),
                          child: DropdownButton<String>(
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
                            style: const TextStyle(color: Color(0xff44885C)),
                            value: selectedCowId,
                            items: activityPlaces.cows!.map((cow) {
                              return DropdownMenuItem<String>(
                                value: cow.cowId,
                                child: Text("Cow ID: ${cow.cowId}"),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedCowId = val;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AddButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    const Center(child: Text('Are you sure?')),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // request done ...
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => ViewPlace(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
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
                        },
                        text: "Save",
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
