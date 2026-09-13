// features/movies/presentation/maneger/movie/watch_movie_response/watch_movie_response_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/features/movies/data/models/watch_movie_response.dart';
import 'package:movie_platform_app/features/movies/domain/use_case/movie_use_case.dart';

part 'watch_movie_response_state.dart';

class WatchMovieResponseCubit extends Cubit<WatchMovieResponseState> {
  WatchMovieResponseCubit(this.movieUseCase) : super(WatchMovieResponseInitial());
  final MovieUseCase movieUseCase;
  Future<void>watchMovie(int movieId)async{
    emit(WatchMovieLoading());
    final result=await movieUseCase.watchMovie(movieId);
    result.fold(ifLeft: (failure){
      emit(WatchMovieFailure(message: failure.message));

    }, ifRight: (success){
      emit(WatchMovieSuccess(movie: success));

    });
  }


  
}
