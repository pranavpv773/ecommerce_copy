// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:ecommerce/module/favourites/model/favorite_model.dart';
import 'package:ecommerce/module/favourites/services/favorite_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favorites_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteServices services = FavoriteServices();
  FavoriteCubit() : super(FavoriteState.initial());

  getFavoriteFn() async {
    emit(state.copyWith(favoriteStatus: FavoriteStatus.loading));
    try {
      final list = await services.getFavoritesApi();
      emit(
        state.copyWith(
            favoriteStatus: FavoriteStatus.loaded, favorites: list.data),
      );
      // ignore: deprecated_member_use
    } on DioError catch (_) {
      emit(state.copyWith(
        favoriteStatus: FavoriteStatus.error,
      ));
    }
  }
}
