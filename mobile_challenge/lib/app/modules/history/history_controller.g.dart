// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryController on HistoryControllerBase, Store {
  late final _$_wordsFromHistoryAtom =
      Atom(name: 'HistoryControllerBase._wordsFromHistory', context: context);

  List<dynamic> get wordsFromHistory {
    _$_wordsFromHistoryAtom.reportRead();
    return super._wordsFromHistory;
  }

  @override
  List<dynamic> get _wordsFromHistory => wordsFromHistory;

  @override
  set _wordsFromHistory(List<dynamic> value) {
    _$_wordsFromHistoryAtom.reportWrite(value, super._wordsFromHistory, () {
      super._wordsFromHistory = value;
    });
  }

  late final _$_statusAtom =
      Atom(name: 'HistoryControllerBase._status', context: context);

  HistoryStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HistoryStateStatus get _status => status;

  @override
  set _status(HistoryStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$getHistoryWordsAsyncAction =
      AsyncAction('HistoryControllerBase.getHistoryWords', context: context);

  @override
  Future<void> getHistoryWords() {
    return _$getHistoryWordsAsyncAction.run(() => super.getHistoryWords());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
