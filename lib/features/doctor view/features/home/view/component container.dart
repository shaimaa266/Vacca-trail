
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../display view/cow_status/presentation/view/cow_status_screen.dart';
import '../../activity place/view/doctor activity place.dart';
import '../../../features/activity system/doctor activity sys.dart';
import '../../../features/breeding system/doctor breeding.dart';
import '../data/manage/providerHelper.dart';

class ComponentContainer extends StatelessWidget with MyConstants {
  ComponentContainer({Key? key}) : super(key: key);
  List<String> images = [
    "assets/images/health history.png",
    "assets/images/breeding system.png",
    "assets/images/activity places.png",
    "assets/images/activity system.png",
  ];

  List<String> titles = [
    "Logs",
    "Breeding System",
    "Activity Places",
    "Activity System",


  ];

  List<Widget> routesList = [
    CowStatus(),
    BreedingDoctorPage(),
    const DoctorActivityPlaces(),
    ActivitySysDoctorPage(),

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
                    width: 200.w,
                    height: 123.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: providerHelper.selectedIndex == index
                          ? containerColor
                          : Colors.white,
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
                    child: Image.asset(
                      images[index],
                    ),
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
