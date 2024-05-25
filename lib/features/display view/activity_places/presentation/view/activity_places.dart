import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
import '../../../custom_widgets/sort_image.dart';
import '../control/activity_place_provider.dart';
import 'activity place view.dart';

class ActivityPlaces extends StatefulWidget {
  const ActivityPlaces({Key? key}) : super(key: key);

  @override
  State<ActivityPlaces> createState() => _ActivityPlacesState();
}

class _ActivityPlacesState extends State<ActivityPlaces> {
  late PageController _pageController;
  int _currentPage = 0;
  List<String> images = [
    "assets/images/cow.jpg",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow  is eating.png",
    "assets/images/eating cow.png"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final activityPlacesProvider =
          Provider.of<ActivityPlaceProvider>(context, listen: false);
      await activityPlacesProvider.fetchAllActivityPlaces();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentPage = (_currentPage + 1) % images.length;
    return Scaffold(
      body: BackGreoundImageContainer(
        child: Column(
          children: [
            TitleRow(textTitle: "Activity Places"),
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
              child: Consumer<ActivityPlaceProvider>(
                builder: (context, activityPlacesProvider, child) {
                  if (activityPlacesProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (activityPlacesProvider.errorMessage != null) {
                    return Center(
                        child: Text(activityPlacesProvider.errorMessage!));
                  } else {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: activityPlacesProvider.activityPlaces.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final activitySystem =
                            activityPlacesProvider.activityPlaces[index];
                        return ActivityPlacesView(
                          placeId: activitySystem.id,
                          imageUrl: images[_currentPage],
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
