import 'package:flutter/material.dart';
import '../../../cow_data/data/model/cows_model.dart';
import '../../data/models/breeding_model.dart';
import '../../data/repos/breedingRepo.dart';

class BreedingProvider extends ChangeNotifier {
  final BreedingRepo breedingRepo;

  BreedingProvider(this.breedingRepo);

  List<BreedingModel> breedingSystems = [];
  List<BreedingModel> filteredSystems = [];
  List<CowModel> filteredCows = [];
  bool isLoading = false;
  String? errorMessage;
  int currentPage = 0;
  final TextEditingController searchController = TextEditingController();
  PageController pageController = PageController();
  int? selectedSystemId;
  int? selectedCowStatus;
  List<String> images = [
    "assets/images/cow.jpg",
    "assets/images/cow eating.png",
    "assets/images/cow eating in place.jpg",
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

  Future<void> fetchAllBreedingSystems() async {
    _setLoading(true);
    try {
      breedingSystems = await breedingRepo.getAllBreedingSystems();
      filteredSystems = breedingSystems;
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchFilteredCows(int systemId, int status) async {
    _setLoading(true);
    try {
      filteredCows = await breedingRepo.getFilteredCows(systemId, status);
      _setError(null);
      print(
          'Fetched ${filteredCows.length} filtered cows for system ID: $systemId and status: $status');
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  void searchBreedingSystems(String query) {
    if (query.isEmpty) {
      filteredSystems = breedingSystems;
    } else {
      filteredSystems = breedingSystems.where((system) =>
          system.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  void applyFilter(int? cowStatus) {
    selectedCowStatus = cowStatus;
    if (selectedSystemId != null && selectedCowStatus != null) {
      fetchFilteredCows(selectedSystemId!, selectedCowStatus!);
    } else {
      filteredSystems = breedingSystems;
      notifyListeners();
    }
  }

  void applyStatusFilter(int cowStatus) {
    selectedCowStatus = cowStatus;
    applyFilter(cowStatus);
  }

  void applySearch() {
    searchBreedingSystems(searchController.text);
  }

  void clearFilters() {
    selectedCowStatus = null;
    selectedSystemId = null;
    searchController.clear();
    filteredSystems = breedingSystems;
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

