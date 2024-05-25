import 'package:flutter/material.dart';
import '../../data/models/breeding_model.dart';
import '../../data/repos/breedingRepo.dart';


class BreedingProvider extends ChangeNotifier {
  final BreedingRepo breedingRepo;

  BreedingProvider(this.breedingRepo);

  List<BreedingModel> breedingSystems = [];
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

  Future<void> fetchAllBreedingSystems() async {
    _setLoading(true);
    try {
      breedingSystems = await breedingRepo.getAllBreedingSystems();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}

