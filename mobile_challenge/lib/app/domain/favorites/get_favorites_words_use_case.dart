import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/models/word.dart';

class GetFavoritesWordsUseCase {
  Future<List<Word>>? call() async {
    var favoritesBox = Hive.box<Word>('favorites');
    final favoritesList = favoritesBox.values.toList();
    return favoritesList.reversed.toList();
  }
}
