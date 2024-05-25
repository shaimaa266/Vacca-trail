

import 'package:app_vacca/features/display%20view/activity_system/presentation/control/activity_system_provider.dart';
import 'package:app_vacca/features/display%20view/activity_system/presentation/view/first.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../custom_widgets/animated nav bar.dart';
import '../../../custom_widgets/background_image_container.dart';
import '../../../custom_widgets/first_row_title.dart';
import '../../../custom_widgets/search_bar.dart';
import '../../../custom_widgets/sort_image.dart';
class ActivitySystems extends StatefulWidget {
  const ActivitySystems({Key? key}) : super(key: key);

  @override
  State<ActivitySystems> createState() => _ActivitySystemsState();
}

class _ActivitySystemsState extends State<ActivitySystems> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final activitySystemProvider =
      Provider.of<ActivitySystemsProvider>(context, listen: false);
      await activitySystemProvider.fetchAllActivitySystems();
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
            TitleRow(textTitle: "Activity Systems"),
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
              child: Consumer<ActivitySystemsProvider>(
                builder: (context, activitySystemProvider, child) {
                  if (activitySystemProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (activitySystemProvider.errorMessage != null) {
                    return Center(child: Text(activitySystemProvider.errorMessage!));
                  } else {
                    return PageView.builder(
                      controller: _pageController,
                      itemCount: activitySystemProvider.activitySystems.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final activitySystem =
                        activitySystemProvider.activitySystems[index];
                        return ActivitySystemView(
                        activitySystemId: activitySystem.id,
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
