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
      print(e.toString());
      rethrow;
    }
  }
}
