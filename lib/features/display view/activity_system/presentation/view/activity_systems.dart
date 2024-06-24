import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/view/activity system view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../../../core/widgets/background_image_container.dart';
import '../../../../../core/widgets/first_row_title.dart';
import '../../../../../core/widgets/search_bar.dart';
class ActivitySystems extends StatelessWidget {
  final int? initialSystemId;

  const ActivitySystems({Key? key, this.initialSystemId}) : super(key: key);

  Future<void> fetchInitialData(BuildContext context) async {
    final activitySystemsProvider =
    Provider.of<ActivitySystemsProvider>(context, listen: false);
    await activitySystemsProvider.fetchAllActivitySystems();

    if (initialSystemId != null) {
      final initialIndex = activitySystemsProvider.filteredSystems.indexWhere(
            (system) => system.id == initialSystemId,
      );
      if (initialIndex != -1) {
        activitySystemsProvider.setCurrentPage(initialIndex);
        // Use animateToPage to smoothly scroll to the initial index
        activitySystemsProvider.pageController.animateToPage(
          initialIndex,
          duration: Duration(milliseconds: 500), // Adjust duration as needed
          curve: Curves.easeInOut, // Optional: Add a curve for animation
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchInitialData(context);
    });

    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Consumer<ActivitySystemsProvider>(
            builder: (context, activitySystemsProvider, child) {
              if (activitySystemsProvider.isLoading) {
                return Center(
                  child: SpinKitFoldingCube(
                    color: Colors.green.shade700,
                    size: 70,
                  ),
                );
              } else if (activitySystemsProvider.errorMessage != null) {
                return Center(
                  child: Text('Error: ${activitySystemsProvider.errorMessage}'),
                );
              } else {
                return Column(
                  children: [
                    TitleRow(textTitle: "Activity Systems"),
                    Row(
                      children: [
                        SearchBarCustom(
                          controller: activitySystemsProvider.searchController,
                          onTap: () => activitySystemsProvider.applySearch(),
                          onPressedSearch: () {},
                          w: 555,
                          h: 50,
                          keyboardType: TextInputType.text,
                          hintText: "Search by System name ....",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PopupMenuButton<int>(
                            icon: Image.asset('assets/images/sort icon.png'),
                            onCanceled: () {
                              activitySystemsProvider.clearFilters();
                            },
                            onSelected: (int value) {
                              activitySystemsProvider.applyFilter(value);
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<int>(
                                  value: 0,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          activitySystemsProvider.applyStatusFilter(1);
                                        },
                                        child: const Text(
                                          ' only Normal cows',
                                          style: TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          activitySystemsProvider.clearFilters();
                                        },
                                        icon: const Icon(Icons.remove),
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
                                          activitySystemsProvider.applyStatusFilter(0);
                                        },
                                        child: const Text(
                                          ' only Abnormal cows ',
                                          style: TextStyle(color: Colors.black, fontSize: 16),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          activitySystemsProvider.clearFilters();
                                        },
                                        icon: const Icon(Icons.remove),
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
                      height: 620,
                      child: PageView.builder(
                        controller: activitySystemsProvider.pageController,
                        itemCount: activitySystemsProvider.filteredSystems.length,
                        onPageChanged: (index) {
                          activitySystemsProvider.setCurrentPage(index);
                          activitySystemsProvider.setSelectedSystemId(
                            activitySystemsProvider.filteredSystems[index].id,
                          );
                        },
                        itemBuilder: (context, index) {
                          final activitySystem = activitySystemsProvider.filteredSystems[index];
                          return ActivitySystemView(
                            activitySystemId: activitySystem.id,
                            imagePath: activitySystemsProvider.images[activitySystemsProvider.currentPage],
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller:activitySystemsProvider.pageController,
                      count: activitySystemsProvider.filteredSystems.length,
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
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}






