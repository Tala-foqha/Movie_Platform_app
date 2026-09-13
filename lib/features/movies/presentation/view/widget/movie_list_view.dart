// features/movies/presentation/view/widget/movie_list_view.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/presentation/view/details_view.dart';
import 'movie_items.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key, required this.movies, });
final List<MovieModel>movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final movie=movies[index];
          return  Padding(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, DetailsView.routeName,
                arguments: movie
                );
              },
              child: MovieItems(title:movie.name, image: movie.mainImage,)),
          );
        },
      ),
    );
  }
}

