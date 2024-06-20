import 'package:app_vacca/features/display%20view/cow_data/presentation/view/cow_feature.dart';
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/home/file.dart';


import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../doctor view/data/manage/state managment/providerHelper.dart';
import '../home/home_screen.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar({super.key});

  @override
  State<Mynavbar> createState() => _MynavbarState();
}

class _MynavbarState extends State<Mynavbar> with MyConstants {
  List<Widget> paths = [Home(), CowFeature(), File()];
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHelper>(
        builder: (context, providerHelper, child) => CurvedNavigationBar(
              items: [
                CurvedNavigationBarItem(
                  child: Image.asset("assets/images/home.png",
                      color: providerHelper.isSelected[0]
                          ? baseColor
                          : Colors.grey),
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(
                    "assets/images/nav bar cow.png",
                    color:
                        providerHelper.isSelected[1] ? baseColor : Colors.grey,
                  ),
                ),
                CurvedNavigationBarItem(
                  child: Image.asset(
                    "assets/images/settings.png",
                    color:
                        providerHelper.isSelected[2] ? baseColor : Colors.grey,
                  ),
                ),
              ],
              index: providerHelper.currentIndex,
              onTap: (index) {
                providerHelper.choosePath(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => paths[providerHelper.currentIndex]));
              },
              animationDuration:  const Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,
              backgroundColor: backgroundColor,
              color:  const Color(0xffFEFEFE),
              height: 50.h,
            ));
  }
}
