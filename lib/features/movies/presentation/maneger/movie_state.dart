// features/movies/presentation/maneger/movie_state.dart
part of 'movie_cubit.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieLoading extends MovieState {}
class MovieSuccesse extends MovieState {
  final List<MovieModel>movies;

  MovieSuccesse({required this.movies});
}
class MovieFailure extends MovieState{
   final String error;

  MovieFailure({required this.error});

}





