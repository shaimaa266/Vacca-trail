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

  Future<List<ActivityPlacesModel>> getFilterByStatus(
      int systemId, int cowStatus) async {
    try {
      final response = await apiService.get(
          urlEndPoint:
              '/activity_place/$systemId/filter-by-cow-status?status=$cowStatus');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
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

  Future<List<ActivityPlacesModel>> searchByType(String query) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/activity_places/filter-by-type?type=$query');
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

  Future<List<ActivityPlacesModel>> addPlace() async {
    try {
      final response = await apiService.post(urlEndPoint: '',body: {});
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

  Future<List<ActivityPlacesModel>> editPlace(int id) async {
    try {
      final response = await apiService.post(urlEndPoint: '',body: {});

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
