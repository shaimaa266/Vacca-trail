
import 'package:app_vacca/features/display%20view/cow_data/data/repo/cow_repo.dart';
import 'package:flutter/material.dart';

import '../../data/model/cows_model.dart';



class CowProvider extends ChangeNotifier {
  final CowRepo cowRepo;
  int id = 0;

  CowProvider(this.cowRepo);

  List<CowModel> cows = [];
  bool isLoading = false;
  String? errorMessage;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    errorMessage = message;
    notifyListeners();
  }
  void getIncreament(){
    for(int i=0;i<6;i++){
      id++;
    }
  }

  Future<void> fetchAllCows() async {
    _setLoading(true);
    try {
      cows = await cowRepo.getAllCows();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}



