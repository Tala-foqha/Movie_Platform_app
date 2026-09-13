// core/service/get_it_services.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/dio_factory.dart';

import 'package:movie_platform_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movie_platform_app/features/auth/domain/repo/auth_repo.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/cart/data/repo/cart_repo_impl.dart';
import 'package:movie_platform_app/features/cart/domain/repo/cart_repo.dart';
import 'package:movie_platform_app/features/cart/domain/usecase/cart_use_case.dart';
import 'package:movie_platform_app/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:movie_platform_app/features/checkout/domain/repo/checkout_repo.dart';
import 'package:movie_platform_app/features/checkout/domain/usecase/checkout_usecase.dart';
import 'package:movie_platform_app/features/favorite/data/repo/favorite_repo_impl.dart';
import 'package:movie_platform_app/features/favorite/domain/repo/favorite_repo.dart';
import 'package:movie_platform_app/features/favorite/domain/usecase/favorite_use_case.dart';
import 'package:movie_platform_app/features/movies/data/repo/movie_repo_impl.dart';
import 'package:movie_platform_app/features/movies/domain/repo/movie_repo.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';
import 'package:movie_platform_app/features/search/data/repo/search_repo_impl.dart';
import 'package:movie_platform_app/features/search/domain/repo/search_repo.dart';
import 'package:movie_platform_app/features/search/domain/usecase/search_use_case.dart';

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


  getIt.registerLazySingleton<MovieRepo>(
    () => MovieRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );

    getIt.registerLazySingleton<MovieUseCase>(
    () => MovieUseCase( movieRepo: getIt<MovieRepo>(),),
  );

  

   getIt.registerLazySingleton<FavoriteRepo>(
    () => FavoriteRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );


   getIt.registerLazySingleton<FavoriteUseCase>(
    () => FavoriteUseCase( favoriteRepo: getIt<FavoriteRepo>(),),
  );




 getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );


   getIt.registerLazySingleton<CartUseCase>(
    () => CartUseCase( cartRepo: getIt<CartRepo>(),),
  );




 getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );


  
   getIt.registerLazySingleton<CheckoutUsecase>(
    () => CheckoutUsecase( checkoutRepo: getIt<CheckoutRepo>(),),
  );




  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(
      apiServices: getIt.get<ApiServices>(),
    ),

  );



  getIt.registerLazySingleton<SearchUseCase>(
    () => SearchUseCase( searchRepo: getIt<SearchRepo>(),),
  );



  




}