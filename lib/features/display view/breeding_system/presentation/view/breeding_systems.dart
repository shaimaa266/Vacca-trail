
import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding%20system%20view.dart';
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
  final int? initialSystemId;

  const BreedingSystems({Key? key, this.initialSystemId}) : super(key: key);

  Future<void> fetchInitialData(BuildContext context) async {
    final breedingProvider =
    Provider.of<BreedingProvider>(context, listen: false);
    await breedingProvider.fetchAllBreedingSystems();

    if (initialSystemId != null) {
      final initialIndex = breedingProvider.filteredSystems.indexWhere(
            (system) => system.id == initialSystemId,
      );
      if (initialIndex != -1) {
        breedingProvider.setCurrentPage(initialIndex);

        breedingProvider.pageController.animateToPage(
          initialIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
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
          child: Consumer<BreedingProvider>(
            builder: (context, breedingProvider, child) {
              if (breedingProvider.isLoading) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitWaveSpinner(
                      waveColor: Colors.green.shade700,
                      color: Colors.black45,
                      size: 70,
                    ),
                  ],
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
                          onTap: () => breedingProvider.searchBreedingSystems(breedingProvider.searchController.text),
                          onPressedSearch: () {},
                          w: 640,
                          h: 50,
                          keyboardType: TextInputType.text,
                          hintText: "Search by System name ....",
                        ),
                      ],
                    ),
                    initialSystemId == null
                        ? Column(
                      children: [
                        SizedBox(
                          height: 615,
                          child: PageView.builder(
                            controller: breedingProvider.pageController,
                            itemCount: breedingProvider.filteredSystems.length,
                            onPageChanged: (index) {
                              breedingProvider.setCurrentPage(index);

                            },
                            itemBuilder: (context, index) {
                              final breeding = breedingProvider.filteredSystems[index];
                              return BreedingSystemView(
                                breedingSystemId: breeding.id,
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
                            dotHeight: 9,
                            dotWidth: 9,
                            type: WormType.thinUnderground,
                          ),
                        ),
                      ],
                    )
                        : SizedBox(
                      height: 650,
                      child: BreedingSystemView(
                        breedingSystemId: initialSystemId!,
                        imagePath: breedingProvider.images[breedingProvider.currentPage],
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







