import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/models/word.dart';

class UpdateWordFavoriteUseCase {
  Future<void> call(String word) async {
    var favoritesBox = Hive.box<Word>('words');
    final wordAtBox = favoritesBox.get(word);
    final words = favoritesBox.values.toList();
    wordAtBox?.isFavorited = true;
    final indexWord = words.indexOf(wordAtBox!);
    favoritesBox.putAt(indexWord, wordAtBox);
  }
}
