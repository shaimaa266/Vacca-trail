import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/cow_data/data/model/cows_model.dart';

class CowRepo {
  final ApiService apiService;

  CowRepo(this.apiService);

  Future<List<CowModel>> getAllCows() async {
    try {
      final response = await apiService.get(urlEndPoint: '/cows');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<CowModel>> getFilteredCowsByStatus(int status) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/cows/filter-by-status?status=$status');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<CowModel>> getFilteredCowsByAge(
      double minRange, double maxRange) async {
    try {
      final response = await apiService.get(
          urlEndPoint:
              '/cows/filter-by-age?min_range=$minRange&max_range=$maxRange');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<CowModel>> getFilteredCowsWithSearch(
      int status, String cowId) async {
    try {
      final response = await apiService.get(
          urlEndPoint:
              '/cows/filter-by-status-with-search?status=$status&cowId=$cowId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<CowModel>> searchCows(String cowId) async {
    try {
      final response =
          await apiService.get(urlEndPoint: '/cows/search?cowId=$cowId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
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
