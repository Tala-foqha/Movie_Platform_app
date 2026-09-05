// features/auth/presentetion/view/resetPassword/widgets/request_reset_pass_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';

class RequestResetPassViewBody extends StatefulWidget {
  const RequestResetPassViewBody({super.key});

  @override
  State<RequestResetPassViewBody> createState() => _RequestResetPassViewBodyState();
}

class _RequestResetPassViewBodyState extends State<RequestResetPassViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
       
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Center(
            child: Text("Password Recovry !",style: TextStyle(
              color: AppColrs.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10,),
          Text("Please enter your email address to recover password.",style: AppStyles.regular14.copyWith(
            fontSize: 12
           
          ),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Form(
            key: context.read<ForgotpasswordCubit>().formKey,
            child: CustomTextFormField(
              controller: context.read<ForgotpasswordCubit>().emailController,
              hinttext: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more validation logic here if needed
                return null;
              },
            ),
          ),
          SizedBox(height: 30,),
          CustomButton(
            text: "Continue",
            onTap: () {
              if (context.read<ForgotpasswordCubit>().formKey.currentState!.validate()) {
                // If the form is valid, proceed with the reset password request
                final email = context.read<ForgotpasswordCubit>().emailController.text;
                context.read<ForgotpasswordCubit>().resetPasswordRequest(email);
              } else {
                // If the form is invalid, enable auto-validation to show errors
                context.read<ForgotpasswordCubit>().autovalidateMode = AutovalidateMode.always;
              }
              // Handle request reset password action
            },
          ),
        ],
      ),
    );
  }
}