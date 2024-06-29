

import 'package:dio/dio.dart';
class ApiService {
  final String baseUrl;
  final Dio dio;
  final String token;

  ApiService({required this.baseUrl, required this.dio, required this.token}) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<Response> get({required String urlEndPoint}) async {
    return await dio.get('$baseUrl$urlEndPoint');
  }

  Future<Response> post({required String urlEndPoint, required dynamic body, required Map<String, dynamic>? headers}) async {
    return await dio.post(
      '$baseUrl$urlEndPoint',
      data: body,
      options: Options(headers: headers),
    );
  }

  /*Future<Response> post({required String urlEndPoint, required Map<String, dynamic> body, required Map<String, dynamic>? headers}) async {
    return await dio.post('$baseUrl$urlEndPoint', data: body, options: Options(headers: headers));
  }*/
  Future<Response> put({required String urlEndPoint, required Map<String, dynamic> body}) async {
    return await dio.put('$baseUrl$urlEndPoint', data: body);
  }

  Future<Response> delete({required String urlEndPoint}) async {
    return await dio.delete('$baseUrl$urlEndPoint');
  }
}


