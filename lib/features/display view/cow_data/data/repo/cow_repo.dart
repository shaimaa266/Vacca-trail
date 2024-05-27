import 'package:app_vacca/core/helper/api_helper.dart';
import 'package:app_vacca/features/display%20view/cow_data/data/model/cows_model.dart';

class CowRepo {
  final ApiService apiService;

  CowRepo(this.apiService);

  Future<List<CowModel>> getAllCows() async {
    try {
      final response =
      await apiService.get(urlEndPoint: '/cows');
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