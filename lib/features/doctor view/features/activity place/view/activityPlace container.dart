import 'package:app_vacca/features/display%20view/activity_places/presentation/control/activity_place_provider.dart';
import 'package:app_vacca/features/doctor%20view/features/activity%20place/view/view%20place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/custom_widgets/constants_mixin.dart';
class ActivityPlaceContainer extends StatelessWidget with MyConstants {
  ActivityPlaceContainer(
      {super.key, required this.placeId, required this.imagePath});
  final int placeId;
  final String imagePath;
  void fetchInitialData(BuildContext context) {
    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    activityPlacesProvider.fetchAllActivityPlaces().then((_) {
      if (initialPlaceId != null) {
        final initialIndex = activityPlacesProvider.filteredPlaces.indexWhere(
              (place) => place.id == initialPlaceId,
        );
        if (initialIndex != -1) {
          activityPlacesProvider.setCurrentPage(initialIndex);
          activityPlacesProvider.pageController.animateToPage(
            initialIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchInitialData(context);
    });
  @override
  Widget build(BuildContext context) {

  }
    return FutureBuilder(
        future: noteProvider.fetchAllNotes(),
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
    } else {
      Consumer<ActivityPlaceProvider>(
        builder: (context, placeProvider, child) {
          if (placeProvider.isLoading) {
            return Center(
              child: SpinKitWanderingCubes(
                color: baseColor,
                size: 50,
              ),
            );
          } else if (placeProvider.errorMessage != null) {
            return Center(
              child: Text(placeProvider.errorMessage!),
            );
          } else {
            final place =
           placeProvider .allActivityPlaces.firstWhere(
                  (system) => system.id == placeId,
              orElse: () => ActivityPlacesModel(
                id: 0,
                name: '',
                goal: '',
              
                cows: [], image: '', activitySystemId: 0, updatedAt: '', createdAt: '', type: '', description: '', capacity: 0, cowCount: 0, latitude: '', longitude: '',
              ),
            );

            if (place.id == 0) {
              return Center(
                child: Text('activity system with ID $placeId not found'),
              );
            }
            return SizedBox(
              height: 665.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 290,
                  childAspectRatio: 2 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                ),
                itemCount: placeProvider.filteredPlaces.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(bottom: 9, left: 12, right: 12),
                  child: Container(
                    width: 260,
                    height: 380,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 6, bottom: 4, left: 6, right: 6),
                          child: SizedBox(
                            width: 265.w,
                            height: 110.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.asset(
                             placeProvider
                                    .images[placeProvider.currentPage],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                        place.name!,
                          style: TextStyle(fontSize: 22.sp, color: Colors.blueGrey),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                  place.goal!,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Center(
                          child: Container(
                            width: 245.w,
                            height: 22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff44885C)),
                            child: MaterialButton(
                              child: const Text(
                                "view more",
                                style: TextStyle(
                                    color: Color(0xffEAEEEC),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ViewPlace(placeId: placeId),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),}
            );
          }
        });
  }
}
