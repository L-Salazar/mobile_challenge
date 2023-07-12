import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/models/word.dart';

class SaveFavoriteWordUseCase {
  Future<void> call(Word word) async {
    var favoritesBox = Hive.box<Word>('favorites');
    favoritesBox.add(word);
  }
}
