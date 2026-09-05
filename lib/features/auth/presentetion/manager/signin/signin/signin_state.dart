// features/auth/presentetion/manager/signin/signin/signin_state.dart
part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {}

class SigninFailure extends SigninState {
  final String error;

  SigninFailure({required this.error});

}
