import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding system view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../custom_widgets/animated nav bar.dart';
import '../../../../../core/widgets/background_image_container.dart';
import '../../../../../core/widgets/first_row_title.dart';
import '../../../../../core/widgets/search_bar.dart';
import '../manage/breeding_provider.dart';
class BreedingSystems extends StatelessWidget {
  final int? initialBreedingSystemId;

  const BreedingSystems({Key? key, this.initialBreedingSystemId}) : super(key: key);

  Future<void> _fetchInitialData(BuildContext context) async {
    final breedingProvider = Provider.of<BreedingProvider>(context, listen: false);
    await breedingProvider.fetchAllBreedingSystems();

    if (initialBreedingSystemId != null) {
      final initialIndex = breedingProvider.breedingSystems.indexWhere(
            (system) => system.id == initialBreedingSystemId,
      );
      if (initialIndex != 0) {
        breedingProvider.setCurrentPage(initialIndex);

        breedingProvider.pageController.animateToPage(
          initialIndex,
          duration:  const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchInitialData(context);
    });

    return Scaffold(
      body: BackGreoundImageContainer(
        child: SingleChildScrollView(
          child: Consumer<BreedingProvider>(
            builder: (context, breedingProvider, child) {
              if (breedingProvider.isLoading) {
                return Center(
                  child: SpinKitFoldingCube(
                    color: Colors.green.shade700,
                    size: 70,
                  ),
                );
              } else if (breedingProvider.errorMessage != null) {
                return Center(
                  child: Text('Error: ${breedingProvider.errorMessage}'),
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
                                          breedingProvider.applyStatusFilter(0);
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
                                          breedingProvider.applyStatusFilter(1);
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
                    SizedBox(
                   height: 620,
                      child: PageView.builder(
                        controller: breedingProvider.pageController,
                        itemCount: breedingProvider.breedingSystems.length,
                        onPageChanged: (index) {
                          breedingProvider.setCurrentPage(index);
                          breedingProvider.applyFilter(null);
                        },
                        itemBuilder: (context, index) {
                          final breedingSystem = breedingProvider.breedingSystems[index];
                          return BreedingSystemView(
                            breedingSystemId: breedingSystem.id,
                            imagePath: breedingProvider.images[breedingProvider.currentPage],
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: breedingProvider.pageController,
                      count: breedingProvider.filteredSystems.length,
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






