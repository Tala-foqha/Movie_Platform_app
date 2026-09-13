// features/favorite/presentation/maneger/favorite/favorite_state.dart
part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class GetFavoritesLoading extends FavoriteState {}

class GetFavoritesSuccess extends FavoriteState {
  final List<FavoriteResponse> favorites;

  GetFavoritesSuccess(this.favorites);
}

class GetFavoritesError extends FavoriteState {
  final String message;

  GetFavoritesError(this.message);
}

class ToggleFavoriteLoading extends FavoriteState {}

class ToggleFavoriteSuccess extends FavoriteState {
  final FavoriteResponse? favorite;

  ToggleFavoriteSuccess(this.favorite);
}

class ToggleFavoriteError extends FavoriteState {
  final String message;

  ToggleFavoriteError(this.message);
}

class IsFavoriteLoading extends FavoriteState {}

class IsFavoriteSuccess extends FavoriteState {

  final IsFavoriteResponse response;

  IsFavoriteSuccess(this.response);

}

class IsFavoriteError extends FavoriteState {

  final String message;

  IsFavoriteError(this.message);}


