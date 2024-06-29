import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../../../core/widgets/background_image_container.dart';
import '../../../../../core/widgets/first_row_title.dart';
import '../../../../../core/widgets/search_bar.dart';
import '../control/activity_place_provider.dart';
import 'activity place view.dart';
class ActivityPlaces extends StatelessWidget {
  final int? initialPlaceId;

  const ActivityPlaces({Key? key, this.initialPlaceId}) : super(key: key);

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

    return Scaffold(
      body: BackGreoundImageContainer(
        child: Consumer<ActivityPlaceProvider>(
          builder: (context, activityPlacesProvider, child) {
            if (activityPlacesProvider.isLoading) {
              return Center(
                child: SpinKitHourGlass(
                  color: Colors.green.shade700,
                ),
              );
            } else if (activityPlacesProvider.errorMessage != null) {
              return Center(
                child: Text(activityPlacesProvider.errorMessage!),
              );
            } else {
              return Column(
                children: [
                  TitleRow(textTitle: "Activity Places"),
                  Row(
                    children: [
                      SearchBarCustom(
                        controller: activityPlacesProvider.searchController,
                        onTap: () {
                          activityPlacesProvider.searchByType(
                            activityPlacesProvider.searchController.text,
                          );
                        },
                        onPressedSearch: () {},
                        w: 635,
                        h: 50,
                        keyboardType: TextInputType.text,
                        hintText: "Search by place type...",
                      ),
                    ],
                  ),
                  if (initialPlaceId == null)
                    Column(
                      children: [
                        SizedBox(
                          height: 620,
                          child: PageView.builder(
                            controller: activityPlacesProvider.pageController,
                            itemCount: activityPlacesProvider.filteredPlaces.length,
                            onPageChanged: (index) {
                              activityPlacesProvider.setCurrentPage(index);
                            },
                            itemBuilder: (context, index) {
                              final activityPlace = activityPlacesProvider.filteredPlaces[index];
                              return ActivityPlacesView(
                                placeId: activityPlace.id,
                                imageUrl: activityPlacesProvider.images[activityPlacesProvider.currentPage],
                              );
                            },
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: activityPlacesProvider.pageController,
                          count: activityPlacesProvider.filteredPlaces.length,
                          effect: WormEffect(
                            dotColor: Colors.blueGrey.shade200,
                            activeDotColor: Colors.green.shade900,
                            dotHeight: 9,
                            dotWidth: 10,
                            type: WormType.thinUnderground,
                          ),
                        ),
                      ],
                    )
                  else
                    SizedBox(
                      height: 650,
                      child: ActivityPlacesView(
                        placeId: initialPlaceId!,
                        imageUrl: activityPlacesProvider.images[activityPlacesProvider.allActivityPlaces.length],
                      ),
                    ),
                ],
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}



