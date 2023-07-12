import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/core/exception/word_not_found_exception.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:mobile_challenge/app/repositories/words_list/words_repository.dart';

class GetWordDetailUsecase {
  final WordsRepository repository;
  GetWordDetailUsecase({
    required this.repository,
  });

  Future<Word?> call(String keyword) async {
    try {
      //Verify in local storage
      final localWord = await getLocalWord(keyword);
      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      var wordBox = Hive.box<Word>('words');
      var historyBox = Hive.box<Word>('history');
      if (localWord != null) {
        await historyBox.put('$keyword$timestamp', localWord);
        log('Palavra "$keyword" encontrada no armazenamento');
        return localWord;
      }

      //Get from API if is null
      final wordData = await repository.getWordDetails(keyword);

      //Save the word in local storage
      await wordBox.put(keyword, wordData!);
      await historyBox.put('$keyword$timestamp', wordData);
      log('Palavra "$keyword" retornada da API');

      return wordData;
    } on WordNotFoundException {
      rethrow;
    } catch (e, s) {
      log('Erro ao buscar palavra', error: e, stackTrace: s);
    }
    return null;
  }

  Future<Word?> getLocalWord(String keyword) async {
    var wordBox = Hive.box<Word>('words');
    Word? storagedKeyword = wordBox.get(keyword);
    return storagedKeyword;
  }
}
