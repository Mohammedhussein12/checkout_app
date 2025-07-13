import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    required String token,
    String? contentType,
  }) async {
    final response = await _dio.post(
      url,
      data: body,
      options: Options(
        validateStatus: (status) => true,
        contentType: contentType,
        headers: headers ?? {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
