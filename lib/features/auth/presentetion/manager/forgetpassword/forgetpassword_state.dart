// features/auth/presentetion/manager/forgetpassword/forgetpassword_state.dart
part of 'forgetpassword_cubit.dart';

@immutable
abstract class ForgotpasswordState {}

class ForgotpasswordInitial extends ForgotpasswordState {}

class ForgotpasswordLoading extends ForgotpasswordState {}

class ForgotpasswordSuccess extends ForgotpasswordState {}

class ForgotpasswordFailure extends ForgotpasswordState {
  final String error;

  ForgotpasswordFailure({required this.error});
}

// Verify Code States
class VerifyCodeLoading extends ForgotpasswordState {}

class VerifyCodeSuccess extends ForgotpasswordState {
  final VerifyCodeResponse response;

  VerifyCodeSuccess({required this.response});
}

class VerifyCodeFailure extends ForgotpasswordState {
  final String error;

  VerifyCodeFailure({required this.error});
}
class ResetPasswordLoading extends ForgotpasswordState {}

class ResetPasswordSuccess extends ForgotpasswordState {}

class ResetPasswordFailure extends ForgotpasswordState {

  final String message;

  ResetPasswordFailure(this.message);}