// features/auth/domain/repo/auth_repo.dart
import 'package:dart_either/dart_either.dart';
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

abstract class AuthRepo {
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody loginRequest);
  Future<Either<Failure, SignupResponse>> signUp(SignupRequestBody signupRequest);
  Future<Either<Failure, PassResetResponse>> resetPasswordRequest(String email);
  Future<Either<Failure,VerifyCodeResponse>>verifyCode(VerifyCodeRequest request);
  Future<Either<Failure,ResetNewPasswordResponse>>resetPassword(ResetNewPasswordRequest request);
  
}