import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/models/activity_system_model.dart';

class ActivitySystemsRepo {
  final ApiService apiService;

  ActivitySystemsRepo(this.apiService);

  Future<List<ActivitySystemModel>> getAllActivitySystems() async {
    try {
      final response =
          await apiService.get(urlEndPoint: '/doc-activity-systems');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['activitySystems'];
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getAllActivitySystems: ${e.toString()}');
      rethrow;
    }
  }


  Future<List<ActivitySystemModel>> searchActivitySystems(String query) async {
    try {
      final response = await apiService.get(urlEndPoint: '/doc-activity-system/search?name=$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['activitySystems'];
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<ActivitySystemModel>> addSystem(
      {required int id,
      required String name,
      required String goal,
      required String causeOfCreation,
      required String description,
      required String activities,
      required List<String> cows,
      required int cowCount}) async {
    try {
      final response = await apiService
          .post(urlEndPoint: '/doc-activity-systems/create', headers: {}, body: {
        'id': id,
        'name': name,
        'goal': goal,
        'description': description,
        'activities': activities,
        'cows': cows,
        'cause_of_creation': causeOfCreation,
        'num_cows_applied': cowCount,
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        print('API response data: $data');
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getFilteredCows: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<ActivitySystemModel>> editSystem(
      {required int id,
      required String name,
      required String goal,
      required String causeOfCreation,
      required String description,
      required String activities,
      required List<String> cows,
      required int cowCount}) async {
    try {
      final response = await apiService
          .put(urlEndPoint: '/doc-activity-systems/update/$id',  body: {
        'id': id,
        'name': name,
        'goal': goal,
        'description': description,
        'activities': activities,
        'cows': cows,
        'cause_of_creation': causeOfCreation,
        'num_cows_applied': cowCount,
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        print('API response data: $data');
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getFilteredCows: ${e.toString()}');
      rethrow;
    }
  }

}
