// features/movies/presentation/view/movies_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/features/movies/presentation/maneger/movie_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/movies_view_body.dart';

class MoviesView extends StatelessWidget {
  final List<String> selectedCategoryNames;

  const MoviesView({
    super.key,
    this.selectedCategoryNames = const [],
  });

  static const routeName = "movie-view";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {
        if (state is MovieFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is MovieLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColrs.primaryColor,
            ),
          );
        }

        if (state is MovieSuccesse) {
          final filteredMovies = selectedCategoryNames.isEmpty
              ? state.movies
              : state.movies.where((movie) {
                  return movie.categories.any(
                    (category) =>
                        selectedCategoryNames.contains(category.name),
                  );
                }).toList();

          return MoviesViewBody(
            movies: filteredMovies,
          );
        }

        return const SizedBox();
      },
    );
  }
}