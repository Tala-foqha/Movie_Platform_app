// features/auth/data/repos/auth_repo_impl.dart
import 'package:dart_either/src/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:movie_platform_app/core/networking/api_constant.dart';
import 'package:movie_platform_app/core/networking/api_service.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/auth/data/models/login_request_body.dart';
import 'package:movie_platform_app/features/auth/data/models/login_response.dart';
import 'package:movie_platform_app/features/auth/data/models/pass_reset_response.dart';
import 'package:movie_platform_app/features/auth/data/models/reset_new_password_request.dart';
import 'package:movie_platform_app/features/auth/data/models/reset_new_password_response.dart';
import 'package:movie_platform_app/features/auth/data/models/signup_request_body.dart';
import 'package:movie_platform_app/features/auth/data/models/signup_response.dart';
import 'package:movie_platform_app/features/auth/data/models/verify_code_request.dart';
import 'package:movie_platform_app/features/auth/data/models/verify_code_response.dart';
import 'package:movie_platform_app/features/auth/domain/repo/auth_repo.dart';

 class AuthRepoImpl implements AuthRepo {
 final ApiServices apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody loginRequest)async {
    try{
      var data=await apiServices.post(
        endPoint: ApiConstants.login,
        data: loginRequest.toJson(),
      );
    
     return Right(LoginResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, SignupResponse>> signUp(SignupRequestBody signupRequest)async {
    try{
      var data=await apiServices.post(
        endPoint: ApiConstants.register,
        data: signupRequest.toJson(),
      );
    
     return Right(SignupResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, PassResetResponse>> resetPasswordRequest(String email)async {
    try{
      var data=await apiServices.post(
        endPoint: ApiConstants.resetPasswordrequest,
        data: {'email': email},
      );
    
     return Right(PassResetResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
   
  

  }

  @override
  Future<Either<Failure, VerifyCodeResponse>> verifyCode(VerifyCodeRequest request)async {
    try{
      var data=await apiServices.post(
        endPoint: ApiConstants.verifyCode,
         data: request.toJson()
         );

     return Right(VerifyCodeResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, ResetNewPasswordResponse>> resetPassword(ResetNewPasswordRequest request)async {
  try{
    var data=await apiServices.post(
        endPoint: ApiConstants.resetNewPass,
         data: request.toJson()
         );

  return Right(ResetNewPasswordResponse.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
    
  }
}