import 'package:app_vacca/features/display%20view/activity_system/presentation/view/activity_systems.dart';
import 'package:app_vacca/features/display%20view/breeding_system/presentation/view/breeding_systems.dart';

import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/doctor%20view/presentation/manage/state%20managment/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import '../activity_places/presentation/view/activity_places.dart';
import '../breeding_system/presentation/manage/breeding_provider.dart';
import '../cow_status/presentation/view/cow_status_screen.dart';

class FeatureContainer extends StatelessWidget with MyConstants {
  FeatureContainer({Key? key}) : super(key: key);
  List<String> images = [
    "assets/images/cow status.png",
    "assets/images/breeding system.png",
    "assets/images/activity places.png",
    "assets/images/location.png",
    "assets/images/activity system.png",
    "assets/images/track by id.png",
  ];

  List<String> titles = [
    "Cow Status",
    "Breeding system",
    "Activity Places",
    "Search by Location",
    "Activity System",
    "Track by ID",
  ];

  List<Widget> routesList = [
    CowStatus(),
    const BreedingSystems(),
    const ActivityPlaces(),
    CowStatus(),
    const  ActivitySystems(),
    CowStatus(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHelper>(
      builder: (context, providerHelper, child) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 290,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 6.0, bottom: 6.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    if (index == 1) {
                      final breedingProvider =
                          Provider.of<BreedingProvider>(context, listen: false);
                      await breedingProvider.fetchAllBreedingSystems();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BreedingSystems(),
                        ),
                      );
                    } else {
                      providerHelper.selectedIndex = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => routesList[index],
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 177.w,
                    height: 103.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: providerHelper.selectedIndex == index
                          ? containerColor
                          : Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 15,
                          spreadRadius: 6,
                          offset: const Offset(0, 0),
                        )
                      ],
                      border: Border.all(
                        color: providerHelper.selectedIndex == index
                            ? containerBorderColor
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(images[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titles[index],
                    style: TextStyle(color: titleColor, fontSize: 26.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
