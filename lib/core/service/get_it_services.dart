// core/helper_function/get_it_services.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/dio_factory.dart';

import 'package:movie_platform_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_platform_app/features/auth/domain/repo/auth_repo.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<Dio>(
  () => DioFactory.getDio(),
);

  getIt.registerLazySingleton<ApiServices>(
    () => ApiServices(
     dio: getIt.get<Dio>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );
    getIt.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase( authRepo: getIt<AuthRepo>(),),
  );
}