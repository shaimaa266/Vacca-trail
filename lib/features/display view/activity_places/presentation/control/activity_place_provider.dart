import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';
import 'package:flutter/material.dart';

import '../../data/repos/activity_place_repo.dart';

class ActivityPlaceProvider extends ChangeNotifier {
  final ActivityPlaceRepo activityPlaceRepo;
  ActivityPlaceProvider(this.activityPlaceRepo);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameSysController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController purposeSysController = TextEditingController();
  final TextEditingController sysInfoController = TextEditingController();
  final PageController pageController = PageController();

  List<ActivityPlacesModel> allActivityPlaces = [];
  List<ActivityPlacesModel> filteredPlaces = [];
  List<ActivityPlacesModel> updatePlaceInfo = [];

  bool isLoading = false;
  String? errorMessage;
  int currentPage = 0;
  int? selectedCowStatus;
  List<String> images = [
    "assets/images/cow.jpg",
    "assets/images/activity place cow.png"

    "assets/images/cow eating in place.jpg",
    "assets/images/cow eating in place.jpg",
    "assets/images/eating cow.png",
  ];

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
      allActivityPlaces = await activityPlaceRepo.getAllActivityPlaces();
      filteredPlaces = allActivityPlaces;
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> searchByType(String query) async {
    _setLoading(true);
    try {
      filteredPlaces = await activityPlaceRepo.searchByType(query);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  void setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
