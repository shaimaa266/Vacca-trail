
import 'package:app_vacca/features/display%20view/home/file.dart';
import 'package:app_vacca/features/display%20view/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../../display view/cow_data/presentation/view/cow_feature.dart';

class ProviderHelper extends ChangeNotifier {
  int currentIndex = 0;
  int index = 0;
  int _selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();
  List<bool> isSelected = [true, false, false];
  List<Widget> paths = [Home(), CowFeature(), File()];

  choosePath(int index) {
    currentIndex = index;
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = (i == index);
    }
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
