// core/networking/dio_factory.dart

import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/helper_function/constants.dart';
import 'package:movie_platform_app/core/helper_function/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptor();
    }

    return dio!;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = SharedPrefHelper.getString(
            SharedPrefKeys.userTokens,
          );

          print('================ TOKEN ================');
          print(token);
          print('========================================');

          options.headers['Accept'] = 'application/json';
          options.headers['Accept-Language'] = 'en';

          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
      ),
    );

    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}