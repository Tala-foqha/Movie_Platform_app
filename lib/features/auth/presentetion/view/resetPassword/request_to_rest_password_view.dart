// features/auth/presentetion/view/resetPassword/request_to_rest_password_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/codeview/code_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/resetPassword/widgets/request_reset_pass_view_body.dart';

class RequestToRestPasswordView extends StatelessWidget {
  const RequestToRestPasswordView({super.key});
  static const String routeName = '/requestToRestPasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotpasswordCubit(getIt.get<AuthUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<ForgotpasswordCubit, ForgotpasswordState>(
          listener: (context, state) {
           if (state is ForgotpasswordFailure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is ForgotpasswordSuccess) {
              // Show success message or navigate to another screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Code Sent to your email')),
              );
             Navigator.pushNamed(context,CodeView.routeName,
             arguments: context.read<ForgotpasswordCubit>().emailController.text
  
  
);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is ForgotpasswordLoading,
              child: RequestResetPassViewBody());
          },
        ),
      ),
    );
  }
}
