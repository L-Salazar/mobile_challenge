// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordListController on WordListControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'WordListControllerBase._status', context: context);

  WordListStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  WordListStateStatus get _status => status;

  @override
  set _status(WordListStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'WordListControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_wordsListAtom =
      Atom(name: 'WordListControllerBase._wordsList', context: context);

  List<dynamic> get wordsList {
    _$_wordsListAtom.reportRead();
    return super._wordsList;
  }

  @override
  List<dynamic> get _wordsList => wordsList;

  @override
  set _wordsList(List<dynamic> value) {
    _$_wordsListAtom.reportWrite(value, super._wordsList, () {
      super._wordsList = value;
    });
  }

  late final _$loadWordsListAsyncAction =
      AsyncAction('WordListControllerBase.loadWordsList', context: context);

  @override
  Future<void> loadWordsList() {
    return _$loadWordsListAsyncAction.run(() => super.loadWordsList());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
