import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/core/widgets/background_image_container.dart';
import 'package:app_vacca/core/widgets/search_bar.dart';
import 'package:app_vacca/features/doctor%20view/features/shared/doctor_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';
import '../../../../../core/widgets/first_row_title.dart';
import 'activityPlace container.dart';
class DoctorActivityPlaces extends StatelessWidget {
  final int? initialPlaceId;

  const DoctorActivityPlaces({super.key, this.initialPlaceId});

  Future<void> fetchInitialData(BuildContext context) async {
    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    await activityPlacesProvider.fetchAllActivityPlaces();

    if (initialPlaceId != null) {
      final initialIndex = activityPlacesProvider.filteredPlaces.indexWhere(
            (place) => place.id == initialPlaceId,
      );
      if (initialIndex != -1) {
        activityPlacesProvider.setCurrentPage(initialIndex);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: FutureBuilder<void>(
          future: fetchInitialData(context),
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
              return Consumer<ActivityPlaceProvider>(
                builder: (context, activityPlacesProvider, child) {
                  if (activityPlacesProvider.errorMessage != null) {
                    return Center(
                      child: Text(activityPlacesProvider.errorMessage!),
                    );
                  } else if (activityPlacesProvider.filteredPlaces.isEmpty) {
                    return const Center(
                      child: Text('No activity places found'),
                    );
                  } else {
                    final currentIndex = activityPlacesProvider.currentPage;
                    final activityPlace = activityPlacesProvider.filteredPlaces[currentIndex];
                    return Column(
                      children: [
                        TitleRow(textTitle: "Activity Places"),
                        Row(
                          children: [
                            SearchBarCustom(
                              controller: activityPlacesProvider.searchController,
                              onTap: () => activityPlacesProvider.searchByType(
                                activityPlacesProvider.searchController.text,
                              ),
                              onPressedSearch: () {},
                              w: 625,
                              h: 50,
                              keyboardType: TextInputType.text,
                              hintText: "Search by place name ...",
                            ),

                          ],
                        ),
                        ActivityPlaceContainer(
                          placeId: activityPlace.id,
                        imagePath: activityPlacesProvider.images[currentIndex],
                        ),
                      ],
                    );
                  }
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: DoctorNavBar(),
    );
  }
}




