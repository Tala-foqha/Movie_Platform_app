// features/movies/presentation/view/widget/movie_items.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({
    super.key, required this.title, required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 216,
          width: 162,
          child: Stack(
            children: [SizedBox(
              height: 216,
              width: 162,
              child: ClipRRect
              (
                borderRadius: BorderRadiusGeometry.circular(39),
              
                child: Image.network(
                  
                  image,fit: BoxFit.fill,),
              )),
            Positioned(
              right: 15,
              bottom: 10,
              child: SvgPicture.asset("assets/SVG/Frame 13.svg")
            )

            ])),
          SizedBox(height: 10,),
          Center(
            child: Text(title,style: AppStyles.medium15.copyWith(
              fontSize: 16
            ),textAlign: TextAlign.center,),
          )
      ],
    );
  }
}
