import 'package:app_vacca/features/Ui/activity_places/activity_places.dart';
import 'package:app_vacca/features/Ui/activity_system/activity_systems.dart';
import 'package:app_vacca/features/Ui/breeding_system/breeding_systems.dart';
import 'package:app_vacca/features/Ui/cow_status/cow_status_screen.dart';
import 'package:app_vacca/features/Ui/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/providerHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
    BreedingSystems(),
    ActivityPlaces(),
    CowStatus(),
    ActivitySystems(),
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
                  onTap: () {
                    providerHelper.selectedIndex = index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => routesList[index],
                      ),
                    );
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
