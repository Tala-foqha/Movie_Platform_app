// features/movies/presentation/view/widget/details_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_platform_app/core/utils/app_colors.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';

import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:movie_platform_app/features/favorite/presentation/maneger/favorite/favorite_cubit.dart';

import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';

import 'package:movie_platform_app/features/movies/presentation/maneger/movie/watch_movie_response/watch_movie_response_cubit.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/movie_player_view.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/review_section.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // =================================================
          // Movie Image + Details
          // =================================================

          Stack(
            clipBehavior: Clip.none,
            children: [
              // =================================================
              // Movie Image
              // =================================================

              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                ),
                child: Image.network(
                  movieModel.mainImage,
                  width: double.infinity,
                  height: 413,
                  fit: BoxFit.cover,
                ),
              ),

              // =================================================
              // Details Container
              // =================================================

              Positioned(
                top: 350,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff1A1A1A),
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      24,
                      24,
                      28,
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        // =================================================
                        // Title + Premium
                        // =================================================

                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movieModel.name,
                                    maxLines: 2,
                                    overflow:
                                        TextOverflow.ellipsis,
                                    style: AppStyles.semiBold16
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),

                                  const SizedBox(height: 5),

                                  Row(
                                    children: [
                                      if (movieModel
                                          .categories
                                          .isNotEmpty)
                                        Text(
                                          movieModel
                                              .categories[0]
                                              .name,
                                          style: AppStyles
                                              .regular14
                                              .copyWith(
                                            color:
                                                Colors.white70,
                                          ),
                                        ),

                                      const SizedBox(width: 5),

                                      Text(
                                        "2D.3D.4DX",
                                        style: AppStyles
                                            .regular14
                                            .copyWith(
                                          color:
                                              Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            // =================================================
                            // Premium / Free
                            // =================================================

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize:
                                    MainAxisSize.min,
                                children: [
                                  Text(
                                    movieModel.isExclusive
                                        ? "Premium"
                                        : "Free",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),

                                  const SizedBox(width: 7),

                                  Icon(
                                    movieModel.isExclusive
                                        ? Icons.workspace_premium
                                        : Icons
                                            .play_circle_outline,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Divider(
                          height: 1,
                          color: Colors.white30,
                        ),

                        const SizedBox(height: 18),

                        // =================================================
                        // Movie Information
                        // =================================================

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            _movieInfo(
                              title: "Censor Rating",
                              value: "A",
                            ),

                            _movieInfo(
                              title: "Duration",
                              value: movieModel.duration,
                            ),

                            _movieInfo(
                              title: "Release date",
                              value:
                                  movieModel.releaseDate,
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // =================================================
                        // Languages
                        // =================================================

                        Text(
                          "Available in languages",
                          style: AppStyles.regular14
                              .copyWith(
                            color: Colors.white70,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "English",
                          style: AppStyles.regular14
                              .copyWith(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Divider(
                          height: 1,
                          color: Colors.white30,
                        ),

                        const SizedBox(height: 18),

                        // =================================================
                        // Story Plot
                        // =================================================

                        Text(
                          "Story Plot",
                          style: AppStyles.semiBold16
                              .copyWith(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          movieModel.description,
                          maxLines: 4,
                          overflow:
                              TextOverflow.ellipsis,
                          style: AppStyles.regular14
                              .copyWith(
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Divider(
                          height: 1,
                          color: Colors.white30,
                        ),

                        const SizedBox(height: 18),

                        // =================================================
                        // Cast
                        // =================================================

                        Text(
                          "Cast",
                          style: AppStyles.semiBold16
                              .copyWith(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          height: 65,
                          child: ListView(
                            scrollDirection:
                                Axis.horizontal,
                            children: [
                              if (movieModel.actors
                                  .isNotEmpty)
                                ...movieModel.actors
                                    .take(5)
                                    .map(
                                  (actor) {
                                    return _castItem(
                                      actor.mainImage,
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // =================================================
          // Space under Details Container
          // =================================================

          const SizedBox(height: 490),

          // =================================================
          // Reviews
          // =================================================

          ReviewsSection(
            movieId: movieModel.id,
          ),

          const SizedBox(height: 25),

          // =================================================
          // Favorite + Watch / Cart
          // =================================================

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Row(
              children: [
                // =================================================
                // Favorite
                // =================================================

                BlocConsumer<
                    FavoriteCubit,
                    FavoriteState>(
                  listener: (context, state) {
                    if (state is ToggleFavoriteError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content:
                              Text(state.message),
                        ),
                      );
                    }

                    if (state is IsFavoriteError) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        SnackBar(
                          content:
                              Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit =
                        context.read<FavoriteCubit>();

                    return Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(8),
                        border: Border.all(
                          color:
                              AppColrs.primaryColor,
                        ),
                      ),
                      child: IconButton(
                        onPressed:
                            state is
                                    ToggleFavoriteLoading
                                ? null
                                : () {
                                    cubit.toggleFavorite(
                                      movieModel.id,
                                    );
                                  },
                        icon: Icon(
                          cubit.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: cubit.isFavorite
                              ? Colors.red
                              : Colors.white,
                          size: 20,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 16),

                // =================================================
                // Watch / Add To Cart
                // =================================================

                Expanded(
                  child: BlocListener<
                      WatchMovieResponseCubit,
                      WatchMovieResponseState>(
                    listener:
                        (context, watchState) {
                      // =================================================
                      // Watch Failure
                      // =================================================

                      if (watchState
                          is WatchMovieFailure) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          SnackBar(
                            content: Text(
                              watchState.message,
                            ),
                          ),
                        );
                      }

                      // =================================================
                      // Watch Success
                      // =================================================

                      if (watchState
                          is WatchMovieSuccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MoviePlayerView(
                                movieUrl:
                                    movieModel.movieUrl,
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: BlocConsumer<
                        CartCubit,
                        CartState>(
                      listener:
                          (context, state) {
                        // =================================================
                        // Cart Failure
                        // =================================================

                        if (state is CartFailure) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content:
                                  Text(state.message),
                            ),
                          );
                        }

                        // =================================================
                        // Cart Success
                        // =================================================

                        if (state is CartSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color(
                                  0xff1A1A1A,
                                ),
                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                    24,
                                  ),
                                ),
                                title: const Text(
                                  "Success",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                content: const Text(
                                  "Movie added to cart successfully!",
                                  style: TextStyle(
                                    color:
                                        Colors.white70,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(
                                        context,
                                      ).pop();
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(
                                        color: Color(
                                          0xffff4538,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },

                      // =================================================
                      // Button
                      // =================================================

                      builder:
                          (context, state) {
                        final bool canWatch =
                            movieModel.hasAccess ||
                                !movieModel.isExclusive;

                        return SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // =================================================
                              // Watch
                              // =================================================

                              if (canWatch) {
                                context
                                    .read<
                                        WatchMovieResponseCubit>()
                                    .watchMovie(
                                      movieModel.id,
                                    );

                                return;
                              }

                              // =================================================
                              // Add To Cart
                              // =================================================

                              if (state
                                  is CartLoading) {
                                return;
                              }

                              context
                                  .read<CartCubit>()
                                  .addMovieToCart(
                                    movieModel.id,
                                  );
                            },
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(
                                0xffff4538,
                              ),
                              foregroundColor:
                                  Colors.white,
                              elevation: 0,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  28,
                                ),
                              ),
                            ),
                            child: state
                                    is CartLoading
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,
                                    child:
                                        CircularProgressIndicator(
                                      color:
                                          Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    canWatch
                                        ? "Watch Now"
                                        : "Add To Cart",
                                    style: AppStyles
                                        .semiBold18
                                        .copyWith(
                                      color:
                                          Colors.white,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // =================================================
  // Movie Information
  // =================================================

  Widget _movieInfo({
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular14.copyWith(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.regular14.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // =================================================
  // Cast
  // =================================================

  Widget _castItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(17),
        child: Image.network(
          imagePath,
          width: 63,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}