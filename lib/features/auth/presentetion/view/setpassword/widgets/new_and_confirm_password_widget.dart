// features/auth/presentetion/view/setpassword/widgets/new_and_confirm_password_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/helper_function/app_regex.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/core/widgets/custom_text_form_field.dart';
import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';

class NewAndConfirmPasswordWidget extends StatefulWidget {
  const NewAndConfirmPasswordWidget({
    super.key, required this.email, required this.code,
  });
   final String email;
  final String code;
  @override
  State<NewAndConfirmPasswordWidget> createState() => _NewAndConfirmPasswordWidgetState();
}

class _NewAndConfirmPasswordWidgetState extends State<NewAndConfirmPasswordWidget> {
  bool obscureText=true;

 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgotpasswordCubit>().formKey,
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("New Password",style: AppStyles.medium15.copyWith(
            color: Colors.white
          ),),
       
      SizedBox(height: 12,),
      CustomTextFormField(
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
        
        controller: context.read<ForgotpasswordCubit>().passwordController,
        hinttext: "Password", validator: (value){
        if (value == null || value.isEmpty){
         return "please enter password";
        }
        if(!AppRegex.isPasswordValid(value)){
         return "please enter a valid password";

        }
      }),
      SizedBox(height: 16,),
      Text("Confirm Password",style: AppStyles.medium15.copyWith(
        color: Colors.white
      ),),
      SizedBox(height: 12,),
       CustomTextFormField(
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
   
        controller: context.read<ForgotpasswordCubit>().confirmPasswordController,
        hinttext: "Confirm Password", validator: (value){
        if (value == null || value.isEmpty){
         return "please enter password";
        }
        if(!AppRegex.isPasswordValid(value)){
         return "please enter a valid password";

        }
        if (value != context.read<ForgotpasswordCubit>().passwordController.text) {
              return 'Password does not match';
            }
            return null;
      }),
      SizedBox(height: 32,),
      CustomButton(text: "Continue",
      onTap: () {
        if(context.read<ForgotpasswordCubit>().formKey.currentState!.validate()){
          context.read<ForgotpasswordCubit>().resetPassword(widget.email,
           widget.code,
            context.read<ForgotpasswordCubit>().passwordController.text);
        }
      },
      )
             ],
      ),
    );
  }
}