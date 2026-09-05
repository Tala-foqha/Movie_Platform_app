// features/auth/presentetion/view/setpassword/set_pasword_view.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/setpassword/widgets/password_changed_success_dialog.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/setpassword/widgets/set_password_view_body.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/signin_view.dart';

class SetPaswordView extends StatelessWidget {
  const SetPaswordView({super.key, required this.email, required this.Code});
  static const String routName="setPassword";
final String email;
final String Code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotpasswordCubit(getIt.get<AuthUseCase>()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SetPasswordBlocConsumer(email: email,Code: Code,),
      ),
    );
  }
}

class SetPasswordBlocConsumer extends StatelessWidget {
  const SetPasswordBlocConsumer({
    super.key, required this.email, required this.Code,
  });
final String email;
final String Code;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotpasswordCubit, ForgotpasswordState>(
      listener: (context, state) {
       if(state is ResetPasswordFailure){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              behavior: SnackBarBehavior.floating,
            ),
          );
       }if(state is ResetPasswordSuccess){
       showDialog( context: context, barrierDismissible: false, builder: (context) {
         return PasswordChangedSuccessDialog(
           onLogin: () { Navigator.pushNamed( 
            context, SigninView.routeName, );
             }
            , );
             }, );
              }
      },
       
      
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ResetPasswordLoading,
          child: SetPasswordViewBody(email:email, code: Code ,));
      },
    );
  }
}
