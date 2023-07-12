import 'package:mobile_challenge/app/repositories/words_list/words_repository.dart';

class GetWordListUseCase {
  final WordsRepository repository;
  GetWordListUseCase({
    required this.repository,
  });

  Future<List<String>> call() async {
    final data = await repository.getWordsList();
    return data;
  }
}
