// features/auth/presentetion/manager/signin/signin/signin_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/core/helper_function/constants.dart';
import 'package:movie_platform_app/core/helper_function/shared_pref_helper.dart';
import 'package:movie_platform_app/features/auth/data/models/login_request_body.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authUseCase) : super(SigninInitial());
  final AuthUseCase authUseCase ;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Future<void> login(LoginRequestBody loginRequestBody,List<String>selectedCategories) async {
    emit(SigninLoading());
    final result = await authUseCase.call(loginRequestBody);
    result.fold(
      ifLeft: (f) => emit(SigninFailure(error:"The email or password may be incorrect.")),
      ifRight: (s) async {
        await saveUserToken(s.accessToken);
        await SharedPrefHelper.saveSelectedCategories(selectedCategories);
        emit(SigninSuccess());
        
      },
    );
  }


    Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userTokens, token);
  }
}
