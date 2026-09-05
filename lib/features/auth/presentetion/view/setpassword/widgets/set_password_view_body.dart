// features/auth/presentetion/view/setpassword/widgets/set_password_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/auth/presentetion/view/setpassword/widgets/new_and_confirm_password_widget.dart';

class SetPasswordViewBody extends StatelessWidget {
  const SetPasswordViewBody({super.key, required this.email, required this.code});
final String email;
final String code;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          SvgPicture.asset("assets/SVG/Arrow.svg",color: Colors.white,),
          SizedBox(height: 8,),
          Center(child: Text("Set Password",style: AppStyles.bold23,)),
          SizedBox(height: 56,),
          NewAndConfirmPasswordWidget(email: email,code: code,),
        ],
      ),
    );
  }
}
