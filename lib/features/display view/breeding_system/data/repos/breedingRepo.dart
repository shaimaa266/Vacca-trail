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
       // print("${response.data}");
        return data.map((json) => BreedingModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e,stack) {
     // print(stack);
      print(e.toString());
      rethrow;
    }
  }

  Future<List<BreedingModel>> searchBreedingSystems(String query) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/doc-breeding-systems/search?name=$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['breedingSystems'];
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
  Future<List<CowModel>> getFilteredCows(int systemId, int status) async {
    try {
      final response = await apiService.get(
          urlEndPoint: '/doc-breeding-systems/$systemId/filter?status=$status');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['cows'];
        return data.map((json) => CowModel.fromJson(json)).toList();
      } else {
        throw Exception('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in getFilteredCows: ${e.toString()}');
      rethrow;
    }
  }

}
