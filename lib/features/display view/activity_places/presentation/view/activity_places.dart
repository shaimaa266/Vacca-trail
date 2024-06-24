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
    final activityPlacesProvider =
    Provider.of<ActivityPlaceProvider>(context, listen: false);
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
                              activityPlacesProvider.searchController.text);
                        },
                        onPressedSearch: () {
                        },
                        w: 555,
                        h: 50,
                        keyboardType: TextInputType.text,
                        hintText: "Search by place type...",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PopupMenuButton<int>(
                          icon: Image.asset('assets/images/sort icon.png'),
                          onSelected: (int value) {
                            if (value == 0 || value == 1) {
                              activityPlacesProvider.applyStatusFilter(
                                  value, initialPlaceId!);
                            } else {
                              activityPlacesProvider.clearFilters();
                            }
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<int>(
                                value: 0,
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        activityPlacesProvider
                                            .applyStatusFilter(0, initialPlaceId!);
                                      },
                                      child: const Text(' only Normal cows ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16)),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        activityPlacesProvider.clearFilters();
                                      },
                                      icon: const Icon(
                                        Icons.minimize,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              PopupMenuItem<int>(
                                value: 1,
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        activityPlacesProvider
                                            .applyStatusFilter(1, initialPlaceId!);
                                      },
                                      child: const Text(
                                        ' only Abnormal cows ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        activityPlacesProvider.clearFilters();
                                      },
                                      icon: const Icon(
                                        Icons.minimize,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ];
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 640,
                    child: PageView.builder(
                      controller: activityPlacesProvider.pageController,
                      itemCount: activityPlacesProvider.filteredPlaces.length,
                      onPageChanged: (index) {
                        activityPlacesProvider.setCurrentPage(index);
                      },
                      itemBuilder: (context, index) {
                        final activityPlace =
                        activityPlacesProvider.filteredPlaces[index];
                        return ActivityPlacesView(
                          placeId: activityPlace.id,
                          imageUrl: activityPlacesProvider
                              .images[activityPlacesProvider.currentPage],
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
                      dotHeight: 16,
                      dotWidth: 16,
                      type: WormType.thinUnderground,
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


