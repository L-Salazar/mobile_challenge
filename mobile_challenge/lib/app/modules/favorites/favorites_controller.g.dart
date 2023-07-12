// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on FavoritesControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'FavoritesControllerBase._status', context: context);

  FavoriteStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  FavoriteStateStatus get _status => status;

  @override
  set _status(FavoriteStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_favoriteWordsAtom =
      Atom(name: 'FavoritesControllerBase._favoriteWords', context: context);

  List<dynamic> get favoriteWords {
    _$_favoriteWordsAtom.reportRead();
    return super._favoriteWords;
  }

  @override
  List<dynamic> get _favoriteWords => favoriteWords;

  @override
  set _favoriteWords(List<dynamic> value) {
    _$_favoriteWordsAtom.reportWrite(value, super._favoriteWords, () {
      super._favoriteWords = value;
    });
  }

  late final _$getFavoritesWordsAsyncAction = AsyncAction(
      'FavoritesControllerBase.getFavoritesWords',
      context: context);

  @override
  Future<void> getFavoritesWords() {
    return _$getFavoritesWordsAsyncAction.run(() => super.getFavoritesWords());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
