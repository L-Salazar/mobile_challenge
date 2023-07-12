import 'package:mobile_challenge/app/models/word.dart';

abstract class WordsRepository {
  Future<List<String>> getWordsList();
  Future<Word?> getWordDetails(String keyword);
}
