// features/favorite/presentation/view/widgets/favorite_header.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 22,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          'Favorites',
          style: AppStyles.bold28.copyWith(
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          'Your favorite movies, all in one place.',
          style: AppStyles.regular14.copyWith(
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}