import 'package:app_vacca/features/display%20view/activity_system/data/models/activity_system_model.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/repo/activity_system_repo.dart';
import 'package:flutter/material.dart';
import '../../../cow_data/data/model/cows_model.dart';
class ActivitySystemsProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<ActivitySystemModel> _activitySystems = [];
  List<ActivitySystemModel> _filteredSystems = [];
  List<CowModel> _filteredCows = [];
  final ActivitySystemsRepo activitySystemsRepo;
  final TextEditingController searchController = TextEditingController();
  int? selectedSystemId;
  int? selectedCowStatus=0;
  late PageController pageController;
  int currentPage = 0;
  List<String> images = [
    "assets/images/cow is eating.png",
    "assets/images/eating cow.png",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow is eating.png",
    "assets/images/eating cow.png",
  ];

  ActivitySystemsProvider(this.activitySystemsRepo) {
    pageController = PageController();
  }

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<ActivitySystemModel> get activitySystems => _activitySystems;
  List<ActivitySystemModel> get filteredSystems => _filteredSystems;
  List<CowModel> get filteredCows => _filteredCows;

  Future<void> fetchAllActivitySystems() async {
    _setLoading(true);
    try {
      _activitySystems = await activitySystemsRepo.getAllActivitySystems();
      _filteredSystems = _activitySystems;
      _filteredCows = [];
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> searchActivitySystems(String query) async {
    _setLoading(true);
    try {
      if (query.isEmpty) {
        _filteredSystems = _activitySystems;
      } else {
        _filteredSystems = _activitySystems
            .where((system) =>
            system.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  Future<void> fetchFilteredCows(int systemId, int status) async {
    _setLoading(true);
    try {
      _filteredCows =
      await activitySystemsRepo.getFilteredCows(systemId, status);
      _setError(null);
      print(
          'Fetched ${_filteredCows.length} filtered cows for system ID: $systemId and status: $status');
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  void applySearch() {
    searchActivitySystems(searchController.text);
  }

  void applyFilter(int value) {
    selectedSystemId = value;
    if (selectedSystemId != null && selectedCowStatus != null) {
      fetchFilteredCows(selectedSystemId!, selectedCowStatus!);
    } else {
      fetchAllActivitySystems();
    }
  }

  void applyStatusFilter(int status) {
    selectedCowStatus = status;
    if (selectedSystemId != null) {
      fetchFilteredCows(selectedSystemId!, selectedCowStatus!);
    }
  }

  void clearFilters() {
    selectedSystemId = null;
    selectedCowStatus = null;
    searchController.clear();
    fetchAllActivitySystems();
  }

  void setCurrentPage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void setSelectedSystemId(int id) {
    selectedSystemId = id;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
