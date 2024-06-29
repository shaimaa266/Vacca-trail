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
  final TextEditingController nameSysController = TextEditingController();
  final TextEditingController purposeSysController = TextEditingController();
  final TextEditingController causeCreateController = TextEditingController();
  final TextEditingController sysInfoController = TextEditingController();
  final TextEditingController activityDuaController = TextEditingController();
  final TextEditingController activitiesController = TextEditingController();
  int? selectedSystemId;
  int? selectedCowStatus = 0;
  late PageController pageController;
  int currentPage = 0;
  List<String> images = [
    "assets/images/cattle-farming.jpg",
    "assets/images/cow eating in place.jpg",
    "assets/images/cow eating.png",
    "assets/images/eating cow.png",
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
      _filteredSystems = await activitySystemsRepo.searchActivitySystems(query);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
    notifyListeners();
  }

  Future<void> getAddSystem(
      {required int id,
      required String name,
      required String goal,
      required String causeOfCreation,
      required String description,
      required String activities,
      required List<String> cows,
      required int cowCount}) async {
    _setLoading(true);
    try {
      _activitySystems = await activitySystemsRepo.addSystem(
          id: id,
          name: name,
          goal: goal,
          causeOfCreation: causeOfCreation,
          description: description,
          activities: activities,
          cows: cows,
          cowCount: cowCount);
      _filteredSystems = _activitySystems;
await fetchAllActivitySystems();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> getUpdateSystem(
      {required int id,
      required String name,
      required String goal,
      required String causeOfCreation,
      required String description,
      required String activities,
      required List<String> cows,
      required int cowCount}) async {
    _setLoading(true);
    try {
      _activitySystems = await activitySystemsRepo.editSystem(
          id: id,
          name: name,
          goal: goal,
          causeOfCreation: causeOfCreation,
          description: description,
          activities: activities,
          cows: cows,
          cowCount: cowCount);
      _filteredSystems = _activitySystems;

      _setError(null);
    } catch (e) {
      _setError(e.toString());
      print(e);
    } finally {
      _setLoading(false);
    }
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
