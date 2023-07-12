import 'dart:developer';

import 'package:mobx/mobx.dart';

import 'package:mobile_challenge/app/domain/favorites/get_favorites_words_use_case.dart';

part 'favorites_controller.g.dart';

enum FavoriteStateStatus {
  initial,
  loading,
  sucess,
  error;
}

class FavoritesController = FavoritesControllerBase with _$FavoritesController;

abstract class FavoritesControllerBase with Store {
  final GetFavoritesWordsUseCase getFavoritesWordsUseCase;
  FavoritesControllerBase({
    required this.getFavoritesWordsUseCase,
  });

  @readonly
  var _status = FavoriteStateStatus.initial;

  @readonly
  var _favoriteWords = [];

  @action
  Future<void> getFavoritesWords() async {
    try {
      _status = FavoriteStateStatus.loading;
      _favoriteWords = await getFavoritesWordsUseCase() ?? [];
      _status = FavoriteStateStatus.sucess;
    } catch (e, s) {
      log('Erro ao buscar lista de favoritos', error: e, stackTrace: s);
      _status = FavoriteStateStatus.error;
    }
  }
}
