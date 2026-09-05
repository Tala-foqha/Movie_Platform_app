// core/widgets/or_widgt.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class OrWidgt extends StatelessWidget {
  const OrWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        SizedBox(
          width: 155,
          child: Divider(color:Color(0xff404040),height: 1,thickness: 1,)),
        SizedBox(width: 8,),
        Text("Or",style: AppStyles.regular14.copyWith(
          color: Colors.white
        ),),
        SizedBox(width: 8,),
        SizedBox(
          width: 155,
          child: Divider(color:Color(0xff404040),height: 1,thickness: 1,)),


        
      ]

    );
  }
}