import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:mobile_challenge/app/core/constants/constants.dart';
import 'package:mobile_challenge/app/core/exception/word_not_found_exception.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:mobile_challenge/app/repositories/words_list/words_repository.dart';

class WordsRepositoryImpl implements WordsRepository {
  final Dio client;
  WordsRepositoryImpl({
    required this.client,
  });

  @override
  Future<List<String>> getWordsList() async {
    final data = await rootBundle.loadString(Constants.wordsListJsonPath);
    final Map<String, dynamic> convertedData = jsonDecode(data);
    List<String> wordsList = [];
    for (var word in convertedData.entries) {
      wordsList.add(word.key);
    }
    return wordsList;
  }

  @override
  Future<Word?> getWordDetails(String keyword) async {
    try {
      final response = await client.get(keyword);
      var pronunciation = 'Pronúncia não definida';
      var meaning = 'Siginificado não especificado';

      if (response.data.containsKey('results')) {
        meaning = response.data['results'][0]['definition'];
      }

      final wordName = response.data['word'];

      if (response.data.containsKey('pronunciation')) {
        pronunciation = response.data['pronunciation']['all'] ??
            response.data['pronunciation'] ??
            '';
      }
      final word = Word(
        name: wordName,
        meaning: meaning,
        pronunciation: pronunciation,
      );
      return word;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw WordNotFoundException();
      }
    }
    return null;
  }
}
