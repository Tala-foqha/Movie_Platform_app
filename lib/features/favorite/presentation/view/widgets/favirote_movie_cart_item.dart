// features/favorite/presentation/view/widgets/favirote_movie_cart_item.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_response.dart';

class FavoriteMovieCard extends StatelessWidget {
  const FavoriteMovieCard({super.key, required this.favoriteResponse});
final FavoriteResponse favoriteResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 155,
      decoration: BoxDecoration(
        color: const Color(0xff151515),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Row(
        children: [
          // Movie Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            child: Image.network(
             favoriteResponse.movie.mainImage,
              width: 105,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 14),

          // Movie Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Favorite
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          favoriteResponse.movie.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.bold19.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const Icon(
                        Icons.favorite,
                        color: Color(0xffE50914),
                        size: 22,
                      ),

                      const SizedBox(width: 10),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Movie Details
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xffE50914),
                        size: 17,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        '8.5',
                        style: AppStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),

                      _divider(),

                      Text(
                        'PG-18',
                        style: AppStyles.regular13.copyWith(
                          color: Colors.white70,
                        ),
                      ),

                      _divider(),

                      Text(
                        favoriteResponse.movie.duration,
                        style: AppStyles.regular13.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Category
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffE50914).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      favoriteResponse.movie.categories[1].name,
                      style: AppStyles.regular13.copyWith(
                        color: const Color(0xffE50914),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 14,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 9),
      color: Colors.white24,
    );
  }
}