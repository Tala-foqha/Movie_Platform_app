// features/movies/presentation/view/details_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_platform_app/core/service/get_it_services.dart';

import 'package:movie_platform_app/features/cart/domain/usecase/cart_use_case.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';

import 'package:movie_platform_app/features/favorite/domain/usecase/favorite_use_case.dart';
import 'package:movie_platform_app/features/favorite/presentation/maneger/favorite/favorite_cubit.dart';

import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';

import 'package:movie_platform_app/features/movies/presentation/maneger/movie/watch_movie_response/watch_movie_response_cubit.dart';

import 'package:movie_platform_app/features/movies/presentation/maneger/reviews/reviews_cubit.dart';

import 'package:movie_platform_app/features/movies/presentation/view/widget/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.movies,
  });

  static const String routeName = "detailsView";

  final MovieModel movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          // =========================
          // Favorite
          // =========================
          BlocProvider(
            create: (context) => FavoriteCubit(
              getIt.get<FavoriteUseCase>(),
            )..isFav(movies.id),
          ),

          // =========================
          // Cart
          // =========================
          BlocProvider(
            create: (context) => CartCubit(
              getIt.get<CartUseCase>(),
            ),
          ),

          // =========================
          // Watch Movie
          // =========================
          BlocProvider(
            create: (context) => WatchMovieResponseCubit(
              getIt.get<MovieUseCase>(),
            ),
          ),

          // =========================
          // Reviews
          // =========================
          BlocProvider(
            create: (context) => ReviewsCubit(
              getIt.get<MovieUseCase>(),
            )..getMovieReviews(movies.id),
          ),
        ],
        child: DetailsViewBody(
          movieModel: movies,
        ),
      ),
    );
  }
}