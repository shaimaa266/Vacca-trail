import 'package:dio/dio.dart';
class ApiService {
  final String baseUrl;
  final Dio dio;
  final String token;

  ApiService({required this.baseUrl, required this.dio, required this.token}) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> get({required String urlEndPoint}) async {
    return await dio.get('$baseUrl$urlEndPoint');
  }
  Future<Response>post({required String urlEndPoint})async{
    return await dio.post('$baseUrl$urlEndPoint');
  }
}

