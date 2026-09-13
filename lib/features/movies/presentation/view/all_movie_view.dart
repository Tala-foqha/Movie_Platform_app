// features/movies/presentation/view/all_movie_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/service/get_it_services.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';
import 'package:movie_platform_app/features/movies/presentation/maneger/movie_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/details_view.dart';

class AllMoviesView extends StatelessWidget {
  const AllMoviesView({super.key});

  static const String routeName = '/all-movies';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(
        movieUseCase: getIt.get<MovieUseCase>(),
      )..getMovies(),
      child: const _AllMoviesViewBody(),
    );
  }
}

class _AllMoviesViewBody extends StatelessWidget {
  const _AllMoviesViewBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'All Movies',
          style: AppStyles.medium22.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieFailure) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is MovieSuccesse) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return Center(
                child: Text(
                  'No movies found',
                  style: AppStyles.medium15.copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailsView.routeName,
                        arguments: movie,
                      );
                    },
                    child: _MovieCard(
                      image: movie.mainImage,
                      title: movie.name,
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xff252525),
                  child: const Center(
                    child: Icon(
                      Icons.movie_outlined,
                      color: Colors.white54,
                      size: 40,
                    ),
                  ),
                );
              },
              loadingBuilder:
                  (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }

                return Container(
                  color: const Color(0xff252525),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.medium15.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}