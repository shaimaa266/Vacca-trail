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

  Future<void> fetchPlacesByStatus(int cowStatus, int placeId) async {
    _setLoading(true);
    try {
      if (cowStatus == 0) {
        filteredPlaces = await activityPlaceRepo.getFilterByStatus(placeId, 0);
      }
      filteredPlaces = await activityPlaceRepo.getFilterByStatus(placeId, 1);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }



  void applyStatusFilter(int value, int placeId) async {
    _setLoading(true);
    notifyListeners();

    try {
      if (value == null || placeId == null) {
        filteredPlaces = allActivityPlaces;
      } else {
        filteredPlaces =
            await activityPlaceRepo.getFilterByStatus(placeId, value);
      }
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
      setCurrentPage(0);
      notifyListeners();
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

  void clearFilters() {
    selectedCowStatus = null;
    placeType = null;
    searchController.clear();
    fetchAllActivityPlaces();
  }
  Future<void> changePlaceInfo(int id) async {
    _setLoading(true);
    try {
      updatePlaceInfo = await activityPlaceRepo.editPlace(id );
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
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
