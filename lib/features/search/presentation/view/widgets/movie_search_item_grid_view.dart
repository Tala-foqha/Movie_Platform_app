// features/search/presentation/view/widgets/movie_search_item_grid_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/presentation/view/details_view.dart';
import 'package:movie_platform_app/features/search/presentation/manger/search/search_cubit.dart';
import 'package:movie_platform_app/features/search/presentation/view/widgets/movie_search_item.dart';

class MovieSearchItemsGridView extends StatelessWidget {
  const MovieSearchItemsGridView({
    super.key,
    required this.movie,
  });

  final List<MovieModel> movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemCount: movie.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              // حفظ الفيلم في Recent Searches
              await context
                  .read<SearchCubit>()
                  .addToRecentMovies(movie[index]);

              // الانتقال إلى صفحة التفاصيل
              Navigator.pushNamed(
                context,
                DetailsView.routeName,
                arguments: movie[index],
              );
            },
            child: MovieSearchItem(
              movie: movie[index],
            ),
          );
        },
      ),
    );
  }
}