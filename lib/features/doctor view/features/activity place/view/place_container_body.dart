import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';

class PlaceContainerBody extends StatelessWidget {
 PlaceContainerBody(
      {super.key, required this.placeId, required this.imageUrl});
  final int placeId;
  final String imageUrl;

  List<String> images = [
    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow eating.png",
    "assets/images/cow.jpg",
    "assets/images/cow breeding.png",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/cow eating in place.jpg",
  ];
  int index = 0;

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
              child: Text('No place with  id : $placeId '),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 6, bottom: 4, left: 6, right: 6),
                child: SizedBox(
                  width: 265.w,
                  height: 110.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: imageUrl == ''
                        ? Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          )
                        : Image.network(
                            activityPlaces.image!,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              Text(
                activityPlaces.name!,
                style: TextStyle(fontSize: 22.sp, color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                activityPlaces.goal!,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          );
        }
      },
    );
  }
}
