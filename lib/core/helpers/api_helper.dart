import 'package:car_zone/core/errors/backend_exception_handler.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio;
  String baseURL = "https://carzone.dev-options.com/api/";

  ApiHelper({required this.dio});

  Future<BackendResult<T, String>> post<T>({
    required String endPoint,
    Map<String, dynamic>? data,
    required String accept,
    required String contentType,
    String? token,
  }) async {
    try {
      final options = Options(
        headers: {
          "Content-Type": contentType,
          "Accept": accept,
          if (token != null) "Authorization": "Bearer $token",
        },
      );
      Response result = await dio.post(
        "$baseURL$endPoint",
        options: options,
        data: data,
      );
      return Success(result.data as T);
    } on DioException catch (e) {
      final errorData = e.response?.data ?? {};
      final handler = BackendExceptionHandlerX.fromResponse(errorData);
      return Failure(handler.message);
    } catch (e) {
      return Failure("حدث خطأ أثناء الاتصال بالخادم. الرجاء المحاولة لاحقًا.");
    }
  }
}
