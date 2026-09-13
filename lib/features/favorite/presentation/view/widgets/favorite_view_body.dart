// features/favorite/presentation/view/widgets/favorite_view_body.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/favorite/presentation/maneger/favorite/favorite_cubit.dart';
import 'package:movie_platform_app/features/favorite/presentation/view/widgets/favirote_movie_cart_item.dart';
import 'package:movie_platform_app/features/favorite/presentation/view/widgets/favorite_header.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FavoritesHeader(),

            const SizedBox(height: 25),

            Expanded(
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
                  if (state is GetFavoritesError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is GetFavoritesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is GetFavoritesError) {
                    return const SizedBox();
                  }

                  if (state is GetFavoritesSuccess) {
                    final favorites = state.favorites;

                    if (favorites.isEmpty) {
                      return const Center(
                        child: Text(
                          'Your favorites list is empty',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: FavoriteMovieCard(
                            favoriteResponse: favorites[index],
                          ),
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}