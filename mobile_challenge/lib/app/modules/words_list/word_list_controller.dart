import 'dart:developer';

import 'package:mobile_challenge/app/domain/word_list/get_word_list_use_case.dart';
import 'package:mobx/mobx.dart';
part 'word_list_controller.g.dart';

enum WordListStateStatus {
  initial,
  loading,
  sucess,
  error;
}

class WordListController = WordListControllerBase with _$WordListController;

abstract class WordListControllerBase with Store {
  final GetWordListUseCase getWordListUseCase;

  WordListControllerBase({
    required this.getWordListUseCase,
  });

  @readonly
  var _status = WordListStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _wordsList = [];

  @action
  Future<void> loadWordsList() async {
    try {
      _status = WordListStateStatus.loading;
      _wordsList = await getWordListUseCase();
      _status = WordListStateStatus.sucess;
    } catch (e, s) {
      log('Falha ao obter lista de palavras', error: e, stackTrace: s);
      _errorMessage = 'Falha ao obter lista de palavras';
      _status = WordListStateStatus.error;
    }
  }
}
