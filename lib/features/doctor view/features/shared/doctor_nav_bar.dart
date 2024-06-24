import 'package:app_vacca/features/display%20view/custom_widgets/constants_mixin.dart';
import 'package:app_vacca/features/display%20view/home/file.dart';


import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import '../../data/manage/state managment/providerHelper.dart';
import '../home/view/home page.dart';
import '../notes/presentation/view/notes.dart';
import '../notes/presentation/view/view_all_notes.dart';

class DoctorNavBar extends StatelessWidget with MyConstants {
  DoctorNavBar({super.key});

  List<Widget> paths = [HomePage(), AllNotes(), File()];

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
                    builder: (_) => paths[providerHelper.currentIndex]),);
          },
          animationDuration: const  Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          backgroundColor: backgroundColor,
          color: const  Color(0xffFEFEFE),
          height: 50.h,
        ));
  }
}
