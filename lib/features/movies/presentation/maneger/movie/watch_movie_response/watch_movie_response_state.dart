// features/movies/presentation/maneger/movie/watch_movie_response/watch_movie_response_state.dart
part of 'watch_movie_response_cubit.dart';

@immutable
abstract class WatchMovieResponseState {}

class WatchMovieResponseInitial extends WatchMovieResponseState {}

class WatchMovieLoading extends WatchMovieResponseState {}
class WatchMovieSuccess extends WatchMovieResponseState{
  final WatchMovieResponse movie;

  WatchMovieSuccess({required this.movie});
}
class WatchMovieFailure extends WatchMovieResponseState{
  final String message;

  WatchMovieFailure({required this.message});

}





