// features/search/presentation/manger/search/search_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/core/helper_function/shared_pref_helper.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/search/data/model/recent_movie_model.dart';
import 'package:movie_platform_app/features/search/domain/usecase/search_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial()) {
    loadRecentMovies();
  }

  final SearchUseCase searchUseCase;

  TextEditingController searchController = TextEditingController();

  List<RecentMovieModel> recentMovies = [];

  // Load Recent Movies
  void loadRecentMovies() {
    recentMovies = SharedPrefHelper.getRecentMovies();
  }

  // Add movie to Recent Search
  Future<void> addToRecentMovies(MovieModel movie) async {
    final recentMovie = RecentMovieModel(
      id: movie.id,
      name: movie.name,
      mainImage: movie.mainImage,
    );

    // Remove it if it already exists
    recentMovies.removeWhere(
      (item) => item.id == recentMovie.id,
    );

    // Add it at the beginning
    recentMovies.insert(0, recentMovie);

    // Keep only the latest 6
    if (recentMovies.length > 6) {
      recentMovies.removeLast();
    }

    // Save to SharedPreferences
    await SharedPrefHelper.saveRecentMovies(recentMovies);
  }

  Future<void> serchMovie(String movieName) async {
    emit(SearchInitial());

    final result = await searchUseCase.call(movieName);

    result.fold(
      ifLeft: (failuer) {
        emit(SearchFailure(message: failuer.message));
      },
      ifRight: (success) {
        emit(SearchSuccess(movies: success));
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}