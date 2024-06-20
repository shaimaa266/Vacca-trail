import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding system view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
import '../manage/breeding_provider.dart';
class BreedingSystems extends StatelessWidget {
  final int? initialBreedingSystemId;

  const BreedingSystems({super.key, this.initialBreedingSystemId});

  Future<void> fetchInitialData(BuildContext context) async {
    final breedingProvider =
    Provider.of<BreedingProvider>(context, listen: false);
    await breedingProvider.fetchAllBreedingSystems();

    if (initialBreedingSystemId != null) {
      final initialIndex = breedingProvider.breedingSystems.indexWhere(
              (system) => system.id == initialBreedingSystemId);
      if (initialIndex != -1) {
        breedingProvider.setCurrentPage(initialIndex);
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
              return Consumer<BreedingProvider>(
                builder: (context, breedingProvider, child) {
                  if (breedingProvider.errorMessage != null) {
                    return Center(
                      child: Text(breedingProvider.errorMessage!),
                    );
                  } else {
                    return Column(
                      children: [
                        TitleRow(textTitle: "Breeding Systems"),
                        Row(
                          children: [
                            SearchBarCustom(
                              controller: breedingProvider.searchController,
                              onTap: () => breedingProvider.applySearch(),
                              onPressedSearch: () {},
                              w: 555,
                              h: 50,
                              keyboardType: TextInputType.text,
                              hintText: "Search by name...",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PopupMenuButton<int>(
                                icon: Image.asset('assets/images/sort icon.png'),
                                onCanceled: () {
                                  breedingProvider.clearFilters();
                                },
                                onSelected: (int value) {
                                  if (value == 1 || value == 0) {
                                    breedingProvider.applyFilter(value);
                                  } else {
                                    breedingProvider.clearFilters();
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
                                              breedingProvider
                                                  .applyStatusFilter(0);
                                            },
                                            child: const Text('Normal'),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              breedingProvider.clearFilters();
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
                                              breedingProvider
                                                  .applyStatusFilter(1);
                                            },
                                            child: const Text('Abnormal'),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              breedingProvider.clearFilters();
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
                            controller: breedingProvider.pageController,
                            itemCount: breedingProvider.breedingSystems.length,
                            onPageChanged: (index) {
                              breedingProvider.setCurrentPage(index);
                              breedingProvider.applyFilter(null);
                            },
                            itemBuilder: (context, index) {
                              final breedingSystem =
                              breedingProvider.breedingSystems[index];
                              return BreedingSystemView(
                                breedingSystemId: breedingSystem.id,
                                imagePath: breedingProvider.images[
                                breedingProvider.currentPage],
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


