import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/models/word.dart';

class RemoveFavoriteWordUseCase {
  Future<void> call(String word) async {
    var favoritesBox = Hive.box<Word>('favorites');
    final Map<dynamic, Word> favoritesMap = favoritesBox.toMap();
    dynamic desiredKey;
    favoritesMap.forEach((key, value) {
      if (value.name == word) {
        desiredKey = key;
      }
    });
    favoritesBox.delete(desiredKey);
  }
}
