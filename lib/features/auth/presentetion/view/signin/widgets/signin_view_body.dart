// features/auth/presentetion/view/signin/widgets/signin_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_platform_app/core/widgets/or_widgt.dart';
import 'package:movie_platform_app/core/widgets/social_item.dart';
import 'package:movie_platform_app/core/widgets/social_item_list.dart';
import 'package:movie_platform_app/features/auth/data/models/login_request_body.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signin/signin/signin_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/resetPassword/request_to_rest_password_view.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/widgets/email_and_password_form.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signup/signup_view.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Skip",style: AppStyles.medium15,)
            ],
          ),
          SizedBox(height: 69,),
          Text("Sign In", style: AppStyles.medium22,),
          SizedBox(height: 14,),
EmailAndPasswordForm() ,
         SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RequestToRestPasswordView.routeName);
                // Handle forgot password action
              },
              child: Text("Forgot Password?",style: AppStyles.regular14.copyWith(
                color: Colors.white
              ),),
            )
          ],),
          SizedBox(height: 28,),
          CustomButton(
  text: 'Sign In',
  onTap:  () {
               if (context
    .read<SigninCubit>()
    .formKey
    .currentState!
    .validate()) {
  
  context
      .read<SigninCubit>()
      .formKey
      .currentState!
      .save();

  context.read<SigninCubit>().login(
    LoginRequestBody(
      Email: context.read<SigninCubit>().emailController.text,
      Password: context.read<SigninCubit>().passwordController.text,
    )
     );

} else {
  context.read<SigninCubit>().autovalidateMode =
      AutovalidateMode.always;

  setState(() {});
}}
),
          SizedBox(height: 28,),
          OrWidgt(),
          SizedBox(height: 28,),
          SocialItemList(),
         Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: AppStyles.regular14.copyWith(
                color: Color(0xffF2A2A2A)
              ),),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,SignupView.routeName);
                  
                },
                child: Text("Sign Up",style: AppStyles.regular14.copyWith(
                  color:Colors.white
                ),),
              )
            ],
          ),
          SizedBox(height: 20,),


        ],
      ),
    );
  }
}