
import 'package:app_vacca/features/display%20view/activity_system/data/models/activity_system_model.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/repo/activity_system_repo.dart';
import 'package:flutter/material.dart';


class ActivitySystemsProvider extends ChangeNotifier {
  final ActivitySystemsRepo activitySystemsRepo;

  ActivitySystemsProvider(this.activitySystemsRepo);

  List<ActivitySystemModel> activitySystems = [];
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

  Future<void> fetchAllActivitySystems() async {
    _setLoading(true);
    try {
      activitySystems = await activitySystemsRepo.getAllActivitySystems();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }
}




