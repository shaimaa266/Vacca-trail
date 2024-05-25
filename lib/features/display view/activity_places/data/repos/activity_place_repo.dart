import '../../../../../core/helper/api_helper.dart';

import '../models/activity_place_model.dart';

class ActivityPlaceRepo {
  final ApiService apiService;
  ActivityPlaceRepo(this.apiService);

  Future<List<ActivityPlacesModel>> getAllActivityPlaces() async {
    try {
      final response = await apiService.get(urlEndPoint: '/activity_places');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['activityPlaces'];
        return data.map((json) => ActivityPlacesModel.fromJson(json)).toList();
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
