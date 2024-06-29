import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:dio/dio.dart';

import '../model/notes_model.dart';

class NoteRepo {
  final ApiService apiService;
  NoteRepo(this.apiService);
  //done..
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final response = await apiService.get(urlEndPoint: '/notes');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notes'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
//not done ...
  Future<List<NoteModel>> addNote({
    required String noteId,
    required int cowId,
    required String? image,
    required String title,
    required String body,
  }) async {
    try {
      var formData = FormData.fromMap({
        'note_id': noteId,
        'cow_id': cowId,
        'image': image != null ? await MultipartFile.fromFile(image) : null,
        'title': title,
        'body': body,
      });

      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      };

      final response = await apiService.post(
        urlEndPoint: '/store',
        headers: headers,
        body: formData,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notes'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }


//done
  Future<List<NoteModel>> deleteNote(int id) async {
    try {
      final response =
          await apiService.delete(urlEndPoint: '/delete/$id');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['notes'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
//done
  Future<List<NoteModel>> editNote({
    required int id,
    required String title,
    required String noteId,
    required String? image,
    required int cowId,
    required List? cow,
    required String body,
    required String createdAt,
    required String updatedAt,
  }) async {
    try {
      final response = await apiService.put(urlEndPoint: '/edit/$id', body: {
        'id': id,
        'title': title,
        'image': image,
        'cow_id': cowId,
        'note_id': noteId,
        'body':body,
        'created_at':createdAt,
        'updated_at':updatedAt,
        'cow':cow,

      });

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data[''];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
//done
  Future<List<NoteModel>> starNote(int id) async {
    try {
      final response =
          await apiService.post(urlEndPoint: '/notes/$id/star', body: {},headers: {});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
//done
  Future<List<NoteModel>> unStarNote(int id) async {
    try {
      final response =
          await apiService.post(urlEndPoint: '/notes/$id/unstar', body: {},headers: {});

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }


//done
  Future<List<NoteModel>> getAllStarredNotes() async {
    try {
      final response = await apiService.get(urlEndPoint: '/notes/star/all');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((json) => NoteModel.fromJson(json)).toList();
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
