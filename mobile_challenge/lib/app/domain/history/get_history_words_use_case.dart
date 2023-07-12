import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/models/word.dart';

class GetHistoryWordsUseCase {
  Future<List<Word>> call() async {
    var historyBox = Hive.box<Word>('history');
    final wordHistory = historyBox.values.toList();
    return wordHistory;
  }
}
