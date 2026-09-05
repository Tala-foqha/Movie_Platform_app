// features/auth/presentetion/manager/signup/signup_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/core/networking/failure.dart';
import 'package:movie_platform_app/features/auth/data/models/signup_request_body.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authUseCase) : super(SignupInitial());
 final  AuthUseCase authUseCase;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController FullNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

Future<void> signup(SignupRequestBody signupRequestBody) async {
  emit(SignupLoading());
  final result = await authUseCase.signUp(signupRequestBody);
  result.fold(
  ifLeft: (f) {
    if (f is ServerFailure) {
      emit(SignupFailure(error: f.message));
    } else {
      emit(SignupFailure(error: f.toString()));
    }
  },
  ifRight: (s) {
    emit(SignupSuccess());
  },
);
}
}
