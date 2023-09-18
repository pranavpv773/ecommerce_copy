// ignore_for_file: must_be_immutable

part of 'favorites_cubit.dart';

enum FavoriteStatus {
  initial,
  loading,
  loaded,
  error,
}

class FavoriteState extends Equatable {
  final FavoriteData favorites;
  final FavoriteStatus favoriteStatus;

  const FavoriteState({
    required this.favorites,
    required this.favoriteStatus,
  });

  factory FavoriteState.initial() {
    return FavoriteState(
      favorites: FavoriteData(),
      favoriteStatus: FavoriteStatus.initial,
    );
  }

  FavoriteState copyWith({
    FavoriteData? favorites,
    FavoriteStatus? favoriteStatus,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
    );
  }

  @override
  List<Object> get props {
    return [
      favorites,
      favoriteStatus,
    ];
  }
}
