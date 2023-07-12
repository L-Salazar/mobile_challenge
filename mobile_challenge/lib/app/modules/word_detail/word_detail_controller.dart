import 'dart:developer';

import 'package:mobile_challenge/app/domain/favorites/remove_favorite_word_use_case.dart';
import 'package:mobile_challenge/app/domain/favorites/save_favorite_word_use_case.dart';
import 'package:mobile_challenge/app/domain/word_detail/get_word_detail_use_case.dart';
import 'package:mobile_challenge/app/domain/word_detail/update_word_favorite_use_case.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:mobx/mobx.dart';

part 'word_detail_controller.g.dart';

enum WordDetailStateStatus {
  initial,
  loading,
  sucess,
  nextWord,
  previousWord,
  favorited,
  unfavorited,
  error;
}

class WordDetailController = WordDetailControllerBase
    with _$WordDetailController;

abstract class WordDetailControllerBase with Store {
  WordDetailControllerBase({
    required this.getWordDetailUsecase,
    required this.saveFavoriteWordUseCase,
    required this.updateWordFavoriteUseCase,
    required this.removeFavoriteWordUseCase,
  });

  final GetWordDetailUsecase getWordDetailUsecase;
  final SaveFavoriteWordUseCase saveFavoriteWordUseCase;
  final UpdateWordFavoriteUseCase updateWordFavoriteUseCase;
  final RemoveFavoriteWordUseCase removeFavoriteWordUseCase;

  @readonly
  var _status = WordDetailStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  Word? _word;

  @action
  Future<void> getWordDetails(String keyword) async {
    try {
      _status = WordDetailStateStatus.loading;
      _word = null;
      final wordData = await getWordDetailUsecase(keyword);
      _word = wordData;
      _status = WordDetailStateStatus.sucess;
    } catch (e, s) {
      log('Erro ao buscar palavra $keyword', error: e, stackTrace: s);
      _errorMessage = 'Erro ao buscar palavra $keyword';
      _status = WordDetailStateStatus.error;
    }
  }

  @action
  void goToNextWord() {
    _status = WordDetailStateStatus.nextWord;
  }

  @action
  void previousWord() {
    _status = WordDetailStateStatus.previousWord;
  }

  Future<void> saveFavoriteWord(Word? wordSelected) async {
    if (wordSelected != null) {
      wordSelected.isFavorited = true;
      await saveFavoriteWordUseCase(wordSelected);
    }
  }

  Future<void> updateWordInStorage(String wordSelected) async {
    await updateWordFavoriteUseCase(wordSelected);
    _word?.isFavorited = true;
    _status = WordDetailStateStatus.favorited;
  }

  Future<void> updateWordUnfavorite(String wordSelected) async {
    await removeFavoriteWordUseCase(wordSelected);
    _word?.isFavorited = false;
    _status = WordDetailStateStatus.unfavorited;
  }

  String getNextWord(List<String> words, String currentWord) {
    final currentWordIndex = words.indexOf(currentWord);
    final nextWord = words[currentWordIndex + 1];
    return nextWord;
  }

  String getPreviousWord(List<String> words, String currentWord) {
    final currentWordIndex = words.indexOf(currentWord);
    if (currentWordIndex == 0) {
      return 'a';
    }
    final previousWord = words[currentWordIndex - 1];
    return previousWord;
  }
}
