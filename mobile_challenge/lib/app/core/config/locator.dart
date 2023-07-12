import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_challenge/app/core/config/enviroment.dart';
import 'package:mobile_challenge/app/domain/favorites/get_favorites_words_use_case.dart';
import 'package:mobile_challenge/app/domain/favorites/remove_favorite_word_use_case.dart';
import 'package:mobile_challenge/app/domain/favorites/save_favorite_word_use_case.dart';
import 'package:mobile_challenge/app/domain/history/get_history_words_use_case.dart';
import 'package:mobile_challenge/app/domain/word_detail/get_word_detail_use_case.dart';
import 'package:mobile_challenge/app/domain/word_detail/update_word_favorite_use_case.dart';
import 'package:mobile_challenge/app/domain/word_list/get_word_list_use_case.dart';
import 'package:mobile_challenge/app/modules/favorites/favorites_controller.dart';
import 'package:mobile_challenge/app/modules/history/history_controller.dart';
import 'package:mobile_challenge/app/modules/word_detail/word_detail_controller.dart';
import 'package:mobile_challenge/app/modules/words_list/word_list_controller.dart';
import 'package:mobile_challenge/app/repositories/words_list/words_repository.dart';
import 'package:mobile_challenge/app/repositories/words_list/words_repository_impl.dart';

final getIt = GetIt.I;

void initDependecies() {
  //Global
  getIt.registerSingleton(
    Dio(
      BaseOptions(
        baseUrl: Env.i['base_url'] ?? '',
        headers: {
          'X-RapidAPI-Key': Env.i['backend_key'] ?? '',
        },
      ),
    ),
  );

  //Words List
  getIt.registerLazySingleton<WordsRepository>(
      () => WordsRepositoryImpl(client: getIt()));
  getIt.registerLazySingleton(() => GetWordListUseCase(repository: getIt()));
  getIt.registerLazySingleton(
      () => WordListController(getWordListUseCase: getIt()));

  //Word detail
  getIt.registerLazySingleton(() => GetWordDetailUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => SaveFavoriteWordUseCase());
  getIt.registerLazySingleton(() => UpdateWordFavoriteUseCase());
  getIt.registerLazySingleton(() => RemoveFavoriteWordUseCase());
  getIt.registerLazySingleton(() => WordDetailController(
        getWordDetailUsecase: getIt(),
        saveFavoriteWordUseCase: getIt(),
        updateWordFavoriteUseCase: getIt(),
        removeFavoriteWordUseCase: getIt(),
      ));

  //History
  getIt.registerLazySingleton(() => GetHistoryWordsUseCase());
  getIt.registerLazySingleton(
      () => HistoryController(getHistoryWordsUseCase: getIt()));

  //Favorites
  getIt.registerLazySingleton(() => GetFavoritesWordsUseCase());
  getIt.registerLazySingleton(
      () => FavoritesController(getFavoritesWordsUseCase: getIt()));
}
