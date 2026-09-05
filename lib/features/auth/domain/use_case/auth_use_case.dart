// features/auth/domain/use_case/auth_use_case.dart
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
import 'package:movie_platform_app/features/auth/domain/repo/auth_repo.dart';

class AuthUseCase extends UseCase<LoginResponse, LoginRequestBody> {
  final AuthRepo authRepo;

  AuthUseCase( {required this.authRepo});

  @override
  Future<Either<Failure, LoginResponse>> call(LoginRequestBody param) {
    return authRepo.login(param);
  }
  Future<Either<Failure, SignupResponse>> signUp(SignupRequestBody param) {
    return authRepo.signUp(param);
  }
  Future<Either<Failure, PassResetResponse>> resetPasswordRequest(String email) {
    return authRepo.resetPasswordRequest(email);
  }
  Future<Either<Failure, VerifyCodeResponse>> verufyCode(VerifyCodeRequest request) {
    return authRepo.verifyCode(request);
  }
  Future<Either<Failure, ResetNewPasswordResponse>> resetNewPassword(ResetNewPasswordRequest request) {
    return authRepo.resetPassword(request);
  }


  
}
abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {}