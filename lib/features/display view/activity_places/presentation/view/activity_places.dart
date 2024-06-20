import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
import '../control/activity_place_provider.dart';
import 'activity place view.dart';

class ActivityPlaces extends StatelessWidget {
  final int? initialPlaceId;

  const ActivityPlaces({super.key, this.initialPlaceId});

  Future<void> fetchInitialData(BuildContext context) async {
    final activityPlacesProvider =
        Provider.of<ActivityPlaceProvider>(context, listen: false);
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
                  } else {
                    return Column(
                      children: [
                        TitleRow(textTitle: "Activity Places"),
                        Row(
                          children: [
                            SearchBarCustom(
                              controller:
                                  activityPlacesProvider.searchController,
                              onTap: () => activityPlacesProvider.applySearch(),
                              onPressedSearch: () {},
                              w: 555,
                              h: 50,
                              keyboardType: TextInputType.text,
                              hintText: "Search by place name ...",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PopupMenuButton<int>(
                                child:
                                    Image.asset('assets/images/sort icon.png'),
                                onSelected: (int value) {
                                  if (value == 2) {
                                    activityPlacesProvider.applyTypeFilter();
                                  } else if (value == 0 || value == 1) {
                                    activityPlacesProvider
                                        .applyStatusFilter(value);
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
                                                  .applyStatusFilter(0);
                                            },
                                            child: const Text('Normal '),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                activityPlacesProvider
                                                    .clearFilters();
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              )),
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
                                                  .applyStatusFilter(1);
                                            },
                                            child: const Text('Abnormal'),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                activityPlacesProvider
                                                    .clearFilters();
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      value: 2,
                                      child: Row(
                                        children: [
                                          const Text(
                                            'By Type',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                activityPlacesProvider
                                                    .clearFilters();
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ];
                                },
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: activityPlacesProvider.pageController,
                            itemCount:
                                activityPlacesProvider.filteredPlaces.length,
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
                        )
                      ],
                    );
                  }
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
