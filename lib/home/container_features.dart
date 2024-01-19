import 'package:app_vacca/activity_places/activity_places.dart';
import 'package:app_vacca/activity_system/activity_systems.dart';
import 'package:app_vacca/breeding_system/breeding_systems.dart';
import 'package:app_vacca/custom_widgets/constants_mixin.dart';
import 'package:flutter/material.dart';
import 'package:app_vacca/cow_status/cow_status_screen.dart';

class FeatureContainer extends StatefulWidget {
  @override
  State<FeatureContainer> createState() => _FeatureContainerState();
}

class _FeatureContainerState extends State<FeatureContainer> with MyConstants {
  int isSelected = -1;

  List<String> images = [
    "assets/images/cow icon.png",
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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
              top: 20.0, left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isSelected = index;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => routesList[index],
                    ),
                  );
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        isSelected == index ? containerColor : Colors.white70,
                    boxShadow: [
                      BoxShadow(color: containerColor, blurRadius: 0)
                    ],
                    border: Border.all(
                      color: isSelected == index
                          ? containerBorderColor
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(images[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  titles[index],
                  style: TextStyle(color: titleColor, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
