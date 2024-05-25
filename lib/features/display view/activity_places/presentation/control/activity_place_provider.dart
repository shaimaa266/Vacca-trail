import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';
import 'package:flutter/material.dart';

import '../../data/repos/activity_place_repo.dart';

class ActivityPlaceProvider extends ChangeNotifier {
  final ActivityPlaceRepo activityPlaceRepo;
  ActivityPlaceProvider(this.activityPlaceRepo);

  List<ActivityPlacesModel> activityPlaces = [];
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

  Future<void> fetchAllActivityPlaces() async {
    _setLoading(true);
    try {
      activityPlaces = await activityPlaceRepo.getAllActivityPlaces();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}

