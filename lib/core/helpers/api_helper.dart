import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio;
  String baseURL = "https://carzone.dev-options.com/";

  ApiHelper({required this.dio});

  Future<BackendResult<T, String>> post<T>({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final options = Options(
        headers: token != null ? {'Authorization': 'Bearer $token'} : null,
      );
      Response result = await dio.post(
        "$baseURL$endPoint",
        options: options,
        data: data,
      );
      return Success(result.data as T);
    } catch (e) {
      return Failure("unknown");
    }
  }
}
