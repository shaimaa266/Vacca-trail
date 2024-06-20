import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/view/activity system view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
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
                child: SpinKitFoldingCube(
                  color: Colors.green.shade700,
                  size: 70,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return Consumer<ActivitySystemsProvider>(
                builder: (context, activitySystemsProvider, child) {
                  if (activitySystemsProvider.errorMessage != null) {
                    return Center(
                      child: Text(activitySystemsProvider.errorMessage!),
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
                                              activitySystemsProvider.applyStatusFilter(0);
                                            },
                                            child: const Text('Normal'),
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
                                              activitySystemsProvider.applyStatusFilter(1);
                                            },
                                            child: const Text('Abnormal'),
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
                        Expanded(
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
                              final activitySystem =
                              activitySystemsProvider.filteredSystems[index];
                              return ActivitySystemView(
                                activitySystemId: activitySystem.id,
                                imagePath: activitySystemsProvider.images[
                                activitySystemsProvider.currentPage],
                              );
                            },
                          ),
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
      bottomNavigationBar: const Mynavbar(),
    );
  }
}




