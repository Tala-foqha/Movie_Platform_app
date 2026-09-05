// features/auth/presentetion/view/signup/signup_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signup/signup_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/signin_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signup/widgets/signup_view_body.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              Navigator.pushNamed(context, SigninView.routeName);
            } else if (state is SignupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignupLoading,
              child: SignupViewBody());
          },
        ),
      ),
    );
  }
}
