// features/favorite/presentation/maneger/favorite/favorite_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_body_request.dart';
import 'package:movie_platform_app/features/favorite/data/models/favorite_response.dart';
import 'package:movie_platform_app/features/favorite/data/models/is_favorite_response.dart';
import 'package:movie_platform_app/features/favorite/domain/usecase/favorite_use_case.dart';
part 'favorite_state.dart';
class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteUseCase favoriteUseCase;
  bool isFavorite = false;
  FavoriteCubit(this.favoriteUseCase) : super(FavoriteInitial());
  Future<void> toggleFavorite(int movieId) async {
    emit(ToggleFavoriteLoading());
    final result = await favoriteUseCase.call(
      FavoriteBodyRequest(movieId: movieId),
    );
    result.fold(
      ifLeft: (failure) {
        emit(ToggleFavoriteError(failure.message));
      },
      ifRight: (response) {
        isFavorite = !isFavorite;
        emit(ToggleFavoriteSuccess(response));
      },
    );
  }
  Future<void> isFav(int movieId) async {
    emit(IsFavoriteLoading());
    final result = await favoriteUseCase.isFav(movieId);
    result.fold(
      ifLeft: (failure) {
        emit(IsFavoriteError(failure.message));
      },
      ifRight: (response) {
        isFavorite = response.isFavorite;
        emit(IsFavoriteSuccess(response));
      },
    );
  }
Future<void>getUserFav()async{
  emit(GetFavoritesLoading());
  final result=await favoriteUseCase.getUserFav();
  result.fold(ifLeft: (failure){
    emit(GetFavoritesError(failure.message));

  }, ifRight: (success){
    emit(GetFavoritesSuccess(success));
  });

}
}