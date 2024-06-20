import 'package:app_vacca/core/widgets/text%20font%20body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/constants_mixin.dart';
import '../../data/models/breeding_model.dart';
import '../manage/breeding_provider.dart';

class BreedingSystemView extends StatelessWidget with MyConstants {
  final int breedingSystemId;
  final String imagePath;

  BreedingSystemView(
      {required this.breedingSystemId, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BreedingProvider>(
      builder: (context, breedingProvider, child) {
        if (breedingProvider.isLoading) {
          return Center(
            child: SpinKitFoldingCube(
              color: Colors.green.shade700,
              size: 70,
            ),
          );
        } else if (breedingProvider.errorMessage != null) {
          return Center(
            child: Text(breedingProvider.errorMessage!),
          );
        } else {
          final breeding = breedingProvider.breedingSystems.firstWhere(
                  (system) => system.id == breedingSystemId,
              orElse: () => BreedingModel(
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

          if (breeding.id == 0) {
            return Center(
              child: Text('Breeding system with ID $breedingSystemId not found'),
            );
          }

          return SingleChildScrollView(
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TextFont(
                            text: "Name : ",
                            height: 40,
                            isDark: false,
                          ),
                          TextFont(
                            text: breeding.name,
                            height: 40,
                            isDark: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const TextFont(
                            text: "Id: ",
                            height: 40,
                            isDark: false,
                          ),
                          TextFont(
                            text: breeding.id.toString(),
                            height: 40,
                            isDark: true,
                          ),
                        ],
                      ),
                      const TextFont(
                        text: "Cause of Creation:",
                        height: 40,
                        isDark: false,
                      ),
                      TextFont(
                        text: breeding.cause_of_creation,
                        height: 80,
                        isDark: true,
                      ),
                      const TextFont(
                        text: "System Goal:",
                        height: 40,
                        isDark: false,
                      ),
                      TextFont(
                        text: breeding.goal,
                        height: 80,
                        isDark: true,
                      ),
                      const TextFont(
                        text: "description:",
                        height: 40,
                        isDark: false,
                      ),
                      TextFont(
                        text: breeding.description,
                        height: 80,
                        isDark: true,
                      ),
                      Row(
                        children: [

                          if (breeding.cows!.isNotEmpty)
                            DropdownButton<String>(
                              focusColor:Colors.grey[300],
                              items: breeding.cows!.map((cow) {
                                return DropdownMenuItem<String>(
                                  value: cow.cowId.toString(),
                                  child: Center(child: Text("Cow ID: ${cow.cowId}")),
                                );
                              }).toList(),
                              onChanged: (val) {},
                              hint:   TextFont(
                                text:
                                "Applied on : ${breeding.cows!.length} cows        ",
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
              ],
            ),
          );
        }
      },
    );
  }
}

