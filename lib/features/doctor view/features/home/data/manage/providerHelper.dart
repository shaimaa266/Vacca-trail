
import 'package:app_vacca/features/display%20view/home/file.dart';
import 'package:app_vacca/features/doctor%20view/features/home/view/home%20page.dart';
import 'package:app_vacca/features/doctor%20view/features/notes/presentation/view/view_all_notes.dart';

import 'package:app_vacca/features/doctor%20view/features/treatment/presentation/view/all%20treatment.dart';
import 'package:flutter/material.dart';


class ProviderHelper extends ChangeNotifier {
  int currentIndex = 0;
  int index = 0;
  int _selectedIndex = 0;
  final TextEditingController searchController = TextEditingController();
  List<bool> isSelected = [true, false, false];
  List<Widget> paths = [HomePage(),AllNotes(), File()];

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
