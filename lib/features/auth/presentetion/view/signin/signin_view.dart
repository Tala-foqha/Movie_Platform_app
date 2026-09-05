// features/auth/presentetion/view/signin/signin_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signin/signin/signin_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  static const String routeName = "/signin";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt.get<AuthUseCase>()
   ),

        
        // dependencies هون
      
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is SigninFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SigninLoading,
              child: const SigninViewBody(),
            );
          },
        ),
      ),
    );
  }
}