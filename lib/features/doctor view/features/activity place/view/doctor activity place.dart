import 'package:app_vacca/features/display%20view/custom_widgets/animated%20nav%20bar.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/background_image_container.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../display view/activity_places/data/models/activity_place_model.dart';
import '../../../../display view/activity_places/presentation/control/activity_place_provider.dart';
import '../../shared/title.dart';
import 'activityPlace container.dart';

class ActivityPlaceDoctorPage extends StatelessWidget {
  final int? initialPlaceId;
  ActivityPlaceDoctorPage({super.key, this.initialPlaceId});

  final TextEditingController controller = TextEditingController();
  int? selectedSystemId;
  int? selectedCowStatus;
  String? placeType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: Provider.of<ActivityPlaceProvider>(context, listen: false).fetchAllActivityPlaces(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('No activity places found.'),
                );
              } else {
                final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
                final activityPlaces = activityPlacesProvider.allActivityPlaces.firstWhere(
                      (system) => system.id == initialPlaceId,
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
                    child: Text('No place with id: $initialPlaceId'),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 36.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyTitle(text: "Activity Place"),
                      const SizedBox(height: 15),
                      SearchBarCustom(
                        controller: controller,
                        onTap: () {},
                        onPressedSearch: () {
                          applySearch(context);
                        },
                        w: 555,
                        h: 50,
                        keyboardType: TextInputType.text,
                        hintText: "Search...",
                      ),
                      ActivityPlaceContainer(
                        placeId: activityPlaces.id,
                        imageUrl: activityPlaces.image ?? '',
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }

  void applySearch(BuildContext context) {
    final query = controller.text;
    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    if (query.isNotEmpty) {
      activityPlacesProvider.applySearch();
    } else {
      activityPlacesProvider.fetchAllActivityPlaces();
    }
  }

  void applyStatusFilter(BuildContext context) {
    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    if (selectedSystemId != null && selectedCowStatus != null) {
      activityPlacesProvider.applyStatusFilter(selectedSystemId!);
    } else if (selectedCowStatus != null) {
      activityPlacesProvider.applyStatusFilter(selectedCowStatus!);
    } else {
      activityPlacesProvider.fetchAllActivityPlaces();
    }
  }

  void applyTypeFilter(BuildContext context) {
    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    if (placeType != null && selectedSystemId != null) {
      activityPlacesProvider.applyTypeFilter(placeType!);
    } else {
      activityPlacesProvider.fetchAllActivityPlaces();
    }
  }

  void clearFilters(BuildContext context) {
    selectedSystemId = null;
    selectedCowStatus = null;
    placeType = null;
    controller.clear();

    final activityPlacesProvider = Provider.of<ActivityPlaceProvider>(context, listen: false);
    activityPlacesProvider.fetchAllActivityPlaces();
  }
}
