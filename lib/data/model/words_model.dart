import 'dart:convert';

List<WordModel> wordModelFromJson(String str) =>
    List<WordModel>.from(json.decode(str).map((x) => WordModel.fromJson(x)));

String wordModelToJson(List<WordModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordModel {
  WordModel({
    required this.id,
    required this.englishWord,
    required this.wordType,
    required this.m1,
    this.m2,
    this.m3,
    this.m4,
    this.m5,
    required this.updatedAt,
    required this.createdAt,
    required this.contributer,
  });

  int id;
  String englishWord;
  String wordType;
  String m1;
  String? m2;
  String? m3;
  String? m4;
  String? m5;
  DateTime updatedAt;
  DateTime createdAt;
  int contributer;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        id: json["id"],
        englishWord: json["english_word"],
        wordType: json["word_type"],
        m1: json["m1"],
        m2: json["m2"],
        m3: json["m3"],
        m4: json["m4"],
        m5: json["m5"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        contributer: json["contributer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "english_word": englishWord,
        "word_type": wordType,
        "m1": m1,
        "m2": m2,
        "m3": m3,
        "m4": m4,
        "m5": m5,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "contributer": contributer,
      };
}
