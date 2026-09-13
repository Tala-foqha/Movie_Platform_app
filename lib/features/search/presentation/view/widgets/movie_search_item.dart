// features/search/presentation/view/widgets/movie_search_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';

class MovieSearchItem extends StatelessWidget {
  const MovieSearchItem({
    super.key,
    required this.movie,
    this.onTap,
  });

  final MovieModel movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 162,
            width: 216,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(27),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    movie.mainImage,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: SvgPicture.asset(
                      "assets/SVG/Frame 13.svg",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            movie.name,
            style: AppStyles.medium15.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}