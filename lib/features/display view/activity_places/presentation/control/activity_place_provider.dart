import 'package:app_vacca/features/display%20view/activity_places/data/models/activity_place_model.dart';
import 'package:flutter/material.dart';

import '../../data/repos/activity_place_repo.dart';

class ActivityPlaceProvider extends ChangeNotifier {
  final ActivityPlaceRepo activityPlaceRepo;
  ActivityPlaceProvider(this.activityPlaceRepo);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameSysController = TextEditingController();
  final TextEditingController purposeSysController = TextEditingController();
  final TextEditingController sysInfoController = TextEditingController();
  final TextEditingController applyDuaController = TextEditingController();
  final TextEditingController causeCreateController = TextEditingController();
final PageController pageController=PageController();

  List<ActivityPlacesModel> allActivityPlaces = [];
  List<ActivityPlacesModel> filteredPlaces = [];
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 0;
  int? selectedCowStatus;
  String? placeType;

  List<String> images = [
    "assets/images/cow.jpg",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow is eating.png",
    "assets/images/cow is eating.png",
    "assets/images/eating cow.png"
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

  void applyStatusFilter(int? cowStatus) {
    selectedCowStatus = cowStatus;
    if (cowStatus == null) {
      filteredPlaces = allActivityPlaces;
    } else {
      filteredPlaces = allActivityPlaces.where((place) {
        return place.cows?.any((cow) => cow.cow_status == cowStatus) ?? false;
      }).toList();
    }
    notifyListeners();
  }

  void applyTypeFilter([String? type]) {
    placeType = type;
    if (type == null || type.isEmpty) {
      filteredPlaces = allActivityPlaces;
    } else {
      filteredPlaces = allActivityPlaces.where((place) {
        return place.type == type;
      }).toList();
    }
    notifyListeners();
  }

  void applySearch() {
    final query = searchController.text;
    if (query.isEmpty) {
      filteredPlaces = allActivityPlaces;
    } else {
      filteredPlaces = allActivityPlaces.where((place) {
        return place.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
    }
    notifyListeners();
  }

  void clearFilters() {
    selectedCowStatus = null;
    placeType = null;
    searchController.clear();
    fetchAllActivityPlaces();
  }

  void setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    nameSysController.dispose();
    sysInfoController.dispose();
    purposeSysController.dispose();
    applyDuaController.dispose();
    causeCreateController.dispose();
    pageController.dispose();
    super.dispose();
  }
}
