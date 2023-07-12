import 'dart:developer';

import 'package:mobx/mobx.dart';

import 'package:mobile_challenge/app/domain/history/get_history_words_use_case.dart';

part 'history_controller.g.dart';

enum HistoryStateStatus {
  initial,
  loading,
  sucess,
  error;
}

class HistoryController = HistoryControllerBase with _$HistoryController;

abstract class HistoryControllerBase with Store {
  final GetHistoryWordsUseCase getHistoryWordsUseCase;
  HistoryControllerBase({
    required this.getHistoryWordsUseCase,
  });

  @readonly
  var _wordsFromHistory = [];

  @readonly
  var _status = HistoryStateStatus.initial;

  @action
  Future<void> getHistoryWords() async {
    try {
      _status = HistoryStateStatus.loading;
      final data = await getHistoryWordsUseCase();
      _wordsFromHistory = data.reversed.toList();
      _status = HistoryStateStatus.sucess;
    } catch (e) {
      log('Erro ao buscar histórico de palavras');
      _status = HistoryStateStatus.error;
    }
  }
}
