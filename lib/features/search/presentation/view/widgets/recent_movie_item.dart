// features/search/presentation/view/widgets/recent_movie_item.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/search/data/model/recent_movie_model.dart';

class RecentMovieItem extends StatelessWidget {
  const RecentMovieItem({
    super.key,
    required this.movie,
  });

  final RecentMovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 162,
          width: 216,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(27),
            child: Image.network(
              movie.mainImage,
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 6),

        Center(
          child: Text(
            movie.name,
            style: AppStyles.medium15.copyWith(
              fontSize: 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            
          ),
        ),
      ],
    );
  }
}