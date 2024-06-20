
import 'package:app_vacca/features/display%20view/cow_data/data/repo/cow_repo.dart';
import 'package:flutter/material.dart';

import '../../data/model/cows_model.dart';

class CowProvider with ChangeNotifier {
  final CowRepo cowRepo;

  CowProvider(this.cowRepo);
  final TextEditingController controller = TextEditingController();
  List<CowModel> _cows = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<CowModel> get cows => _cows;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCows(String query, int? status, double? minRange, double? maxRange) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      if (query.isNotEmpty) {
        _cows = await cowRepo.searchCows(query);
      } else if (status != null) {
        _cows = await cowRepo.getFilteredCowsByStatus(status);
      } else if (minRange != null && maxRange != null) {
        _cows = await cowRepo.getFilteredCowsByAge(minRange, maxRange);
      } else {
        _cows = await cowRepo.getAllCows();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllCows() async {
    await fetchCows('', null, null, null);
  }

  Future<void> fetchFilteredCows(int status) async {
    await fetchCows('', status, null, null);
  }

  Future<void> fetchFilteredCowsByAge(double minRange, double maxRange) async {
    await fetchCows('', null, minRange, maxRange);
  }

  Future<void> searchCows(String query) async {
    await fetchCows(query, null, null, null);
  }
}



