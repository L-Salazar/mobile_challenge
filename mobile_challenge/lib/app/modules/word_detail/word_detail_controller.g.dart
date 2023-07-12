// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordDetailController on WordDetailControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'WordDetailControllerBase._status', context: context);

  WordDetailStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  WordDetailStateStatus get _status => status;

  @override
  set _status(WordDetailStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'WordDetailControllerBase._errorMessage', context: context);

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

  late final _$_wordAtom =
      Atom(name: 'WordDetailControllerBase._word', context: context);

  Word? get word {
    _$_wordAtom.reportRead();
    return super._word;
  }

  @override
  Word? get _word => word;

  @override
  set _word(Word? value) {
    _$_wordAtom.reportWrite(value, super._word, () {
      super._word = value;
    });
  }

  late final _$getWordDetailsAsyncAction =
      AsyncAction('WordDetailControllerBase.getWordDetails', context: context);

  @override
  Future<void> getWordDetails(String keyword) {
    return _$getWordDetailsAsyncAction.run(() => super.getWordDetails(keyword));
  }

  late final _$WordDetailControllerBaseActionController =
      ActionController(name: 'WordDetailControllerBase', context: context);

  @override
  void goToNextWord() {
    final _$actionInfo = _$WordDetailControllerBaseActionController.startAction(
        name: 'WordDetailControllerBase.goToNextWord');
    try {
      return super.goToNextWord();
    } finally {
      _$WordDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void previousWord() {
    final _$actionInfo = _$WordDetailControllerBaseActionController.startAction(
        name: 'WordDetailControllerBase.previousWord');
    try {
      return super.previousWord();
    } finally {
      _$WordDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
