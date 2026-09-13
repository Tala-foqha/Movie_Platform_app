// features/checkout/data/repo/checkout_repo_impl.dart
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_request.dart';
import 'package:movie_platform_app/features/checkout/data/model/checkout_response.dart';
import 'package:movie_platform_app/features/checkout/domain/repo/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final ApiServices apiServices;

  CheckoutRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, CheckoutResponse>> checkout(CheckoutRequest request)async {
    try{
      var data=await apiServices.post(
        endPoint: ApiConstants.checkout, data: request.toJson());
        return Right(CheckoutResponse.fromJson(data));
    }on DioException catch (e) {
      return Left(
        ServerFailure.fromDioError(e),
      );
    } catch (e) {
      return Left(
        ServerFailure(e.toString()),
      );
    }
 
  }
}