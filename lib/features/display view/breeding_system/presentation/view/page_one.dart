import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/constants_mixin.dart';
import '../../data/models/breeding_model.dart';
import '../manage/breeding_provider.dart';

class BreedingSystemView extends StatelessWidget with MyConstants {
  final int breedingSystemId;
  final String imagePath;
  int i=0;


  BreedingSystemView({required this.breedingSystemId, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BreedingProvider>(
      builder: (context, breedingProvider, child) {
        if (breedingProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
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
                cows_count: 0, cows: [

              ],

              ));

          if (breeding.id == 0) {
            return Center(
              child: Text('Breeding system with ID $breedingSystemId not found'),
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
                            getText(text: "Name : ", height: 40),
                            getText(text: breeding.name, height: 40),
                          ],
                        ),
                        Row(
                          children: [
                            getText(text: "Id: ", height: 40),
                            getText(text: breeding.id.toString(), height: 40),
                          ],
                        ),
                        getText(text: "Cause of Creation:", height: 40),
                        getText(text: breeding.cause_of_creation, height: 80),
                        getText(text: "System Goal:", height: 40),
                        getText(text: breeding.goal, height: 40),
                        getText(text: "description:", height: 40),
                        getText(text: breeding.description, height: 80),
                        getText(text: "Existing Cows: ", height: 40),
                        getText(text: "${breeding.cows.length}", height: 40),

                        getText(text: "Created at:", height: 40),
                        getText(text: breeding.created_at, height: 40),
                        getText(text: "Updated at:", height: 40),
                        getText(text: breeding.updated_at, height: 40),
                        if (breeding.cows.isNotEmpty)
                          ...breeding.cows.map((cow) {
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
                          getText(text: "No cows in this breeding system.", height: 40),
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


