// features/movies/presentation/view/widget/custom_app_bar_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/search_and_profile_widget.dart';
import 'package:movie_platform_app/features/search/presentation/view/search_view.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       
        Column(
    crossAxisAlignment: CrossAxisAlignment.start,                     
    
          children: [
    
            Text("Hey, Alaa",style: AppStyles.semiBold16,),
            SizedBox(height: 5,),
              Row(
                children: [
                  Text("Karangamal",style: AppStyles.regular14.copyWith(color: AppColrs.primaryColor),),
                  SizedBox(width: 5,),
                  SvgPicture.asset('assets/SVG/Vector 9.svg')
                ],
              ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SearchView.routName),
          child: SearchAndProfileWidget(imagePath: 'assets/SVG/Search_light.svg',)),
        SizedBox(width: 16,),
         SearchAndProfileWidget(imagePath: 'assets/SVG/User_light.svg',),
    
      ],
    );
  }
}
