// core/networking/api_service.dart

import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';

class ApiServices {
  final Dio dio;

  ApiServices({required this.dio});

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.post(
      '${ApiConstants.baseUrl}$endPoint',
      data: data,
    );

    return response.data;
  }

  Future<dynamic> get({
    required String endPoint,
  }) async {
    var response = await dio.get(
      '${ApiConstants.baseUrl}$endPoint',
      
    );

    return response.data;
  }
  Future<Map<String, dynamic>> delete({
    required String endPoint,
  }) async {
    var response = await dio.delete(
      '${ApiConstants.baseUrl}$endPoint',
    );

    return response.data;
  }

}