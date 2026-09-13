// features/search/presentation/view/widgets/recent_movie_grid_view.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/search/data/model/recent_movie_model.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/recent_movie_item.dart';

class RecentMoviesGridView extends StatelessWidget {
  const RecentMoviesGridView({
    super.key,
    required this.movies,
  });

  final List<RecentMovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return RecentMovieItem(
          movie: movies[index],
        );
      },
    );
  }
}