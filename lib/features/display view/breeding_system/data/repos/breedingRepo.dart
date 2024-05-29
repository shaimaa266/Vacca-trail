import '../../../../../core/helper/api_helper.dart';
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
}
