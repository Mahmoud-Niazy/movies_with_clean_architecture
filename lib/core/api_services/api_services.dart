import 'package:dio/dio.dart';
import 'package:movie/core/api_services/api_constance.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.apiBaseUrl,
      ),
    );
  }

  Future<Map<String,dynamic>> get({
    required String path,
}) async{
    var response = await dio.get(
      path,
    );
    return response.data;
  }
}
