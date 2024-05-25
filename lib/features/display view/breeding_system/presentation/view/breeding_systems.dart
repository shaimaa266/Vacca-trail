import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding system view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
import '../../../custom_widgets/sort_image.dart';
import '../manage/breeding_provider.dart';

class BreedingSystems extends StatefulWidget {
  const BreedingSystems({Key? key}) : super(key: key);

  @override
  State<BreedingSystems> createState() => _BreedingSystemsState();
}

class _BreedingSystemsState extends State<BreedingSystems> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final breedingProvider =
          Provider.of<BreedingProvider>(context, listen: false);
      await breedingProvider.fetchAllBreedingSystems();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<String> images = [
    "assets/images/cow  is eating.png",
    "assets/images/eating cow.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/eating cow.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Column(
          children: [
            TitleRow(textTitle: "Breeding Systems"),
            Row(
              children: [
                SearchBarCustom(
                    w: 555,
                    h: 50,
                    keyboardType: TextInputType.text,
                    hintText: "Search..."),
                const SortIcon(),
              ],
            ),
            Expanded(
              child: Consumer<BreedingProvider>(
                builder: (context, breedingProvider, child) {
                  if (breedingProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (breedingProvider.errorMessage != null) {
                    return Center(child: Text(breedingProvider.errorMessage!));
                  } else {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: breedingProvider.breedingSystems.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final breedingSystem =
                            breedingProvider.breedingSystems[index];
                        return BreedingSystemView(
                          breedingSystemId: breedingSystem.id,
                          imagePath: images[0],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
