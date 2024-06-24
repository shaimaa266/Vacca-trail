import 'package:app_vacca/core/helper/api_helper.dart';

import '../model/treatment_model.dart';

class TreatmentRepo{

  final ApiService apiService;
  TreatmentRepo(this.apiService);
  Future<List<TreatmentModel>> getAllTreatments() async {
    try {
      final response = await apiService.get(urlEndPoint: '/treatments/all');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['treatments'];
        return data.map((json) => TreatmentModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<TreatmentModel>> addTreatment() async {
    try {
      final response = await apiService.post(urlEndPoint: '',body: {});
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        return data.map((json) => TreatmentModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<TreatmentModel>> deleteTreatment(int id) async {
    try {
      final response = await apiService.post(urlEndPoint: '/treatment/$id',body: {});
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notes'];
        return data.map((json) => TreatmentModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<List<TreatmentModel>> editTreatment(int id) async {
    try {
      final response = await apiService.post(urlEndPoint: '/treatment/$id',body: {});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        return data.map((json) => TreatmentModel.fromJson(json)).toList();
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