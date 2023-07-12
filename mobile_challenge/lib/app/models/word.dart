import 'dart:convert';

import 'package:hive/hive.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word {
  @HiveField(0)
  String name;

  @HiveField(1)
  String meaning;

  @HiveField(2)
  String pronunciation;

  @HiveField(3)
  bool isFavorited;

  Word({
    required this.name,
    required this.meaning,
    required this.pronunciation,
    this.isFavorited = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'meaning': meaning,
      'pronunciation': pronunciation,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      name: map['word'] ?? '',
      meaning: map['definition'] ?? '',
      pronunciation: map['pronunciation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Word.fromJson(String source) => Word.fromMap(json.decode(source));
}
