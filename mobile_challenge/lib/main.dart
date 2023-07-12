import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobile_challenge/app/core/config/enviroment.dart';
import 'package:mobile_challenge/app/core/config/locator.dart';
import 'package:mobile_challenge/app/mobile_challenge.dart';
import 'package:mobile_challenge/app/models/word.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(WordAdapter());
  await Hive.openBox<Word>('words');
  await Hive.openBox<Word>('favorites',
      keyComparator: (dynamic k1, dynamic k2) => 1);
  await Hive.openBox<Word>('history',
      keyComparator: (dynamic k1, dynamic k2) => 1);
  await Env.i.load();
  initDependecies();
  runApp(const MobileChallenge());
}
