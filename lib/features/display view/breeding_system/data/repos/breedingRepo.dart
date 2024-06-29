import '../../../../../core/helper/api_helper.dart';
import '../../../cow_data/data/model/cows_model.dart';
import '../models/breeding_model.dart';
class BreedingRepo {
  final ApiService apiService;

  BreedingRepo(this.apiService);

  Future<List<BreedingModel>> getAllBreedingSystems() async {
    try {
      final response = await apiService.get(urlEndPoint: '/doc-breeding-systems');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['breadingSystems'];
        print("${response.data}");
        return data.map((json) => BreedingModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
     // print(stack);
      print(e.toString());
      rethrow;
    }
  }

  Future<List<BreedingModel>> searchBreedingSystems(String query) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/doc-activity-system/search?name$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['breadingSystems'];
        return data.map((json) => BreedingModel.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
print("--------------no system with this name !--------------------");
        return [];
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in searchActivitySystems: ${e.toString()}');
      rethrow;
    }
  }

  Future<List<BreedingModel>> addSystem(
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
          .post(urlEndPoint: '/doc-breeding-systems/create', headers: {}, body: {
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
        return data.map((json) => BreedingModel.fromJson(json)).toList();
      } else {
        throw Exception(
            'API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getFilteredCows: ${e.toString()}');
      rethrow;
    }
  }
  Future<List<BreedingModel>> editSystem(
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
          .put(urlEndPoint: '/doc-breeding-systems/update/$id', body: {
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
        return data.map((json) => BreedingModel.fromJson(json)).toList();
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
