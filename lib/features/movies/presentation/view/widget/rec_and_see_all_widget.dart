// features/movies/presentation/view/widget/rec_and_see_all_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/presentation/view/all_movie_view.dart';

class RecAndSeeAllWidget extends StatelessWidget {
  const RecAndSeeAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Recommended Movies",style: AppStyles.semiBold16,),
        Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMoviesView()));
              },
              child: Text("See All",style: AppStyles.regular14.copyWith(
                color: AppColrs.primaryColor
              ),),
            ),
            SizedBox(width: 5,),
            SvgPicture.asset("assets/SVG/Vector 9.svg")
          ],
        )
      ],
    );
  }
}
