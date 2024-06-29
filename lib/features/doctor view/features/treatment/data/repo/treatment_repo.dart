import 'package:app_vacca/core/helper/api_helper.dart';

import '../model/treatment_model.dart';

class TreatmentRepo {
  final ApiService apiService;
  TreatmentRepo(this.apiService);
  Future<List<TreatmentModel>> getAllTreatments(int cowId) async {
    try {
      final response =
          await apiService.get(urlEndPoint: '/cow/$cowId/treatments/all');
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

  Future<List<TreatmentModel>> addTreatment(
      {required int cowId,
      required String name,
      required dynamic searchTerm,
      required dynamic disease,
      required int doses,
      required dynamic diagnose}) async {
    try {
      final response = await apiService
          .post(urlEndPoint: '/cow/$cowId/treatment/create', body: {
        'name': name,
        'search_term':searchTerm,
        'disease':disease,
        'doses':doses,
        'diagnose':diagnose,
      }, headers: {
            'Accept':'application/json',
      });
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
      final response = await apiService
          .post(urlEndPoint: '/treatment/delete/$id', body: {}, headers: {
            "Accept":"application/json"
      });
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

  Future<List<TreatmentModel>> editTreatment({required int cowId,
    required String name,
    required dynamic searchTerm,
    required dynamic disease,
    required int doses,
    required dynamic diagnose}) async {
    try {
      final response = await apiService
          .post(urlEndPoint: '/treatment/$cowId/edit', body: {
        'name': name,
        'search_term':searchTerm,
        'disease':disease,
        'doses':doses,
        'diagnose':diagnose,
      }, headers: {
        "Accept":"application/json",

      });

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
