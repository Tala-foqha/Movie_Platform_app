// features/auth/presentetion/view/codeview/code_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/codeview/widget/code_view_body.dart';

class CodeView extends StatelessWidget {
  CodeView({super.key, required this.email});
  final String email;
  static const String routeName = '/EnterCodeView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotpasswordCubit(getIt.get<AuthUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body:  CodeViewBody(email: email,),
      ),
    );
  }
}
