import 'package:app_vacca/core/helper/api_helper.dart';

import '../model/notes_model.dart';

class NoteRepo {
  final ApiService apiService;
  NoteRepo(this.apiService);
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

  Future<List<NoteModel>> addNote({
    required String noteId,
    required int cowId,
    required String? image,
    required String title,
    required String body,
  }) async {
    try {
      final response = await apiService.post(urlEndPoint: '', body: {
        'note_id': noteId,
        'cowId': cowId,
        'image': image,
        'title': title,
        'body': body,
      });
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

  Future<List<NoteModel>> deleteNote(int id) async {
    try {
      final response =
          await apiService.post(urlEndPoint: '/note/$id', body: {});
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
      final response = await apiService.put(urlEndPoint: '/note/$id', body: {
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

  Future<List<NoteModel>> starNote(int id) async {
    try {
      final response =
          await apiService.post(urlEndPoint: '/note/$id', body: {});

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

  Future<List<NoteModel>> unStarNote(int id) async {
    try {
      final response =
          await apiService.post(urlEndPoint: '/note/$id', body: {});

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
}
