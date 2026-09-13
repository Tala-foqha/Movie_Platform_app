// features/cart/data/repo/cart_repo_impl.dart
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_body_request.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_response.dart';
import 'package:movie_platform_app/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiServices apiServices;

  CartRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, CartResponse>> addMovieToCart(CartBodyRequest request)async {
   try{
    var data=await apiServices.post(endPoint: ApiConstants.addToCart, data: request.toJson());
     return Right(CartResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    

   }
  }

  @override
Future<Either<Failure, void>> deleteMovieFromCart(int movieId) async {
  try {
    await apiServices.delete(
      endPoint: '${ApiConstants.deleteMovie}/$movieId',
    );

    return const Right(null);
  } on DioException catch (e) {
    return Left(ServerFailure.fromDioError(e));
  } catch (e) {
    return Left(ServerFailure(e.toString()));
  }
}
  

  @override
  Future<Either<Failure,List< CartResponse>>> GetCartMovie()async {
   try{
        var data=await apiServices.get(endPoint: ApiConstants.GetCartMovie,);
         final List cartsJson = data['data'] ?? [];

    final carts = cartsJson

        .map(

          (cart) => CartResponse.fromJson(

            cart,

          ),

        )

        .toList();
         return Right(carts);

   }on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    

   }
  }
}