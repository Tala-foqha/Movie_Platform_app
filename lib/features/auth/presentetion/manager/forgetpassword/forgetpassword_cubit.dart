// features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/features/auth/data/models/reset_new_password_request.dart';
import 'package:movie_platform_app/features/auth/data/models/verify_code_request.dart';
import 'package:movie_platform_app/features/auth/data/models/verify_code_response.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';

part 'forgetpassword_state.dart';

class ForgotpasswordCubit extends Cubit<ForgotpasswordState> {
  ForgotpasswordCubit(this.authUseCase) : super(ForgotpasswordInitial());

  final AuthUseCase authUseCase;
  TextEditingController emailController =TextEditingController();
   TextEditingController passwordController =TextEditingController();
     TextEditingController confirmPasswordController =TextEditingController();


  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Future<void> resetPasswordRequest(String email) async {
    emit(ForgotpasswordLoading());
    final result = await authUseCase.resetPasswordRequest(email);
    result.fold(
      ifLeft: (f) => emit(ForgotpasswordFailure(error: f.toString())),
      ifRight: (s) async {
        emit(ForgotpasswordSuccess());
      },
    );
  }
  Future<void> verifyCode(String email, String code) async {
  emit(VerifyCodeLoading());

  final request = VerifyCodeRequest(
    Email: email,
    Code: code,
  );

  final result = await authUseCase.verufyCode(request);

  result.fold(
    ifLeft: (f) => emit(
      VerifyCodeFailure(error: f.toString()),
    ),
    ifRight: (s) => emit(
      VerifyCodeSuccess(response: s),
    ),
  );
}
Future<void>resetPassword(String Email,String code,String NewPassword  )async{
  emit(ResetPasswordLoading());
   final result = await authUseCase.resetNewPassword(
    ResetNewPasswordRequest(
      Code:code , Email: Email, NewPassword: NewPassword)

   );
    result.fold(
    ifLeft: (f) => emit(
      VerifyCodeFailure(error: f.toString()),
    ),
    ifRight: (s) => emit(
      ResetPasswordSuccess(),
    ),
  );


}
  
}
