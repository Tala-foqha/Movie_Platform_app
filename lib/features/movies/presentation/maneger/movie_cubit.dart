// features/movies/presentation/maneger/movie_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/movies/data/models/movie_model.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit( {required this.movieUseCase}) : super(MovieInitial());

  final MovieUseCase movieUseCase;

  Future<void> getMovies() async {
    emit(MovieLoading());

    final result = await movieUseCase(NoParam());

    result.fold(
      ifLeft: (failure) {
        emit(MovieFailure(error: failure.message));
      },
      ifRight: (movies) {
        emit(MovieSuccesse(movies: movies));
      },
    );
  }
}