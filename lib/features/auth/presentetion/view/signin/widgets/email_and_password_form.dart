// features/auth/presentetion/view/signin/widgets/email_and_password_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/helper_function/app_regex.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/signin/signin/signin_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/signin/widgets/password_validator.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool obscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialcharacters = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  
    void initState() {
    super.initState();
    passwordController = context.read<SigninCubit>().passwordController;
    setupPasswordControllerListner();
  }

  void setupPasswordControllerListner() {
    passwordController.addListener(() {
      hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
      hasSpecialcharacters = AppRegex.hasSpecialCharacter(
        passwordController.text,
      );
      hasNumber = AppRegex.hasNumber(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
    });
    void dispose() {
      passwordController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:context.read<SigninCubit>().formKey,
      child:
  Column(
        children: [
           SizedBox(height: 23,),
          CustomTextFormField(
            controller: context.read<SigninCubit>().emailController,
            hinttext: 'E-mail', validator: (value) { 
            if(value == null || value.isEmpty||!AppRegex.isEmailValid(value)){
              return 'Please enter a valid email';
            }
            return null;

           },),
          SizedBox(height: 14,),
          CustomTextFormField(
            controller: context.read<SigninCubit>().passwordController,
            hinttext: 'Password', validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter a valid password';}
              },
               obscureText: obscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
         SizedBox(height: 16),
          PasswordValidator(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialcharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
           
           

        ]
      )
    );
  }
}