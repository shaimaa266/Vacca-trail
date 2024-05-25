
import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/home/file.dart';
import 'package:app_vacca/features/doctor%20view/presentation/manage/state%20managment/providerHelper.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/notes/presentation/view/notes.dart';
import 'package:app_vacca/features/doctor%20view/presentation/view/features/treatment/treatment.dart';
import 'package:app_vacca/features/doctor%20view/ui/home/body/home%20page.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class Mynavbar extends StatefulWidget {
  const Mynavbar({super.key});

  @override
  State<Mynavbar> createState() => _MynavbarState();
}

class _MynavbarState extends State<Mynavbar> with MyConstants {
  List<Widget> paths = [HomePage(), EmptyTreatment(), File()];
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
              animationDuration: Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,
              backgroundColor: Color(0xffFEFEFE),
              color: backgroundColor,
              height: 50.h,
            ));
  }
}
