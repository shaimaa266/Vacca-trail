import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/activity_system/data/models/activity_system_model.dart';

import '../../../cow_data/data/model/cows_model.dart';
class ActivitySystemsRepo {
  final ApiService apiService;

  ActivitySystemsRepo(this.apiService);

  Future<List<ActivitySystemModel>> getAllActivitySystems() async {
    try {
      final response = await apiService.get(urlEndPoint: '/doc-activity-systems');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['activitySystems'];
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getAllActivitySystems: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<CowModel>> getFilteredCows(int systemId, int status) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/doc-activity-system/$systemId/filter?status=$status'
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        print('API response data: $data');
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getFilteredCows: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<ActivitySystemModel>> searchActivitySystems(String query) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/doc-activity-system/search?name=$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['activitySystem'];
        return data.map((json) => ActivitySystemModel.fromJson(json)).toList();
      } else if (response.statusCode == 404) {

        return [];
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in searchActivitySystems: ${e.toString()}');
      rethrow;
    }
  }
}






