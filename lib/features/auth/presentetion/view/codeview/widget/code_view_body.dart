// features/auth/presentetion/view/codeview/widget/code_view_body.dart

import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';

import 'package:movie_platform_app/features/auth/presentetion/manager/forgetpassword/forgetpassword_cubit.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/codeview/widget/box_code_widget.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/codeview/widget/resend_row_code.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/setpassword/set_pasword_view.dart';

class CodeViewBody extends StatefulWidget {
  const CodeViewBody({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<CodeViewBody> createState() => _CodeViewBodyState();
}

class _CodeViewBodyState extends State<CodeViewBody> {
  Timer? _timer;
  int _secondsLeft = 60;
  bool isError = false;

  final TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_secondsLeft == 0) {
          timer.cancel();
        } else {
          setState(() {
            _secondsLeft--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotpasswordCubit, ForgotpasswordState>(
      listener: (context, state) {

        // =========================
        // VERIFY CODE - FAILURE
        // =========================
        if (state is VerifyCodeFailure) {
          pinController.clear();

          setState(() {
            isError = true;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }

        // =========================
        // VERIFY CODE - SUCCESS
        // =========================
        if (state is VerifyCodeSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SetPaswordView(
                Code: pinController.text,
                
                email: widget.email,),
            ),
          );
        }

      
        if (state is ForgotpasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },

      builder: (context, state) {
        return ModalProgressHUD(
          // Loading سواء Verify أو Resend
          inAsyncCall:
              state is VerifyCodeLoading ,
              

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

               
                Center(
                  child: Text(
                    "Check yor email !",
                    style: AppStyles.medium22.copyWith(
                      color: AppColrs.primaryColor,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "We have sent the code to your email.",
                  style: AppStyles.regular14.copyWith(
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 28),

                
                BoxCodeWidget(
                  isError: isError,
                  controller: pinController,

                  onChanged: (value) {
                    if (isError && value.isNotEmpty) {
                      setState(() {
                        isError = false;
                      });
                    }
                  },
                ),

                const SizedBox(height: 28),

              
                CustomButton(
                  text: "Verify",
                  onTap: () {
                    final code = pinController.text;

                    context
                        .read<ForgotpasswordCubit>()
                        .verifyCode(
                          widget.email,
                          code,
                        );
                  },
                ),

                const SizedBox(height: 20),

                // =========================
                // RESEND CODE
                // =========================
                ResendRowCode(
                  secondsLeft: _secondsLeft,

                  onResend: () {
                    context
                        .read<ForgotpasswordCubit>()
                        .resetPasswordRequest(
                          widget.email,
                        );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}