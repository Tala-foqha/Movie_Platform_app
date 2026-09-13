// features/movies/presentation/view/widget/movies_view_body.dart
import 'package:flutter/material.dart';

import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/custom_app_bar_widget.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/movie_list_view.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/rec_and_see_all_widget.dart';
import 'package:movie_platform_app/features/movies/presentation/view/widget/trending_widget.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key, required this.movies});
final List<MovieModel>movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
       
        children: [
            SizedBox(height: 45,),
          CustomAppBarWidget(),
          SizedBox(height: 30,),
          TrendingWidget(),
          SizedBox(height: 66,),
          RecAndSeeAllWidget(),
          SizedBox(height: 15,),
          MovieListView(movies: movies,)
        ],
      ),
    );
  }
}
