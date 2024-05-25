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

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final activityPlacesProvider =
          Provider.of<ActivityPlacesProvider>(context, listen: false);
      await activityPlacesProvider.fetchAllActivityPlace();
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
              child: Consumer<ActivityPlacesProvider>(
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
                          activityPlaceId: activitySystem.id,
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
