// To parse this JSON data, do
//
//     final wordModel = wordModelFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

List<WordModel> wordModelFromJson(String str) =>
    List<WordModel>.from(json.decode(str).map((x) => WordModel.fromJson(x)));

String wordModelToJson(List<WordModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordModel {
  WordModel({
    required this.id,
    required this.englishWord,
    required this.nativeWord,
    required this.exp1,
    required this.exp2,
    required this.exp3,
    required this.exp4,
    required this.partofspeach,
    required this.lang,
    required this.author,
    required this.editor,
    required this.status,
    required this.dateAdded,
  });

  int id;
  String englishWord;
  String nativeWord;
  String exp1;
  String exp2;
  String exp3;
  String exp4;
  String partofspeach;
  String lang;
  String author;
  String editor;
  String status;
  String dateAdded;

  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        id: json["id"],
        englishWord: json["englishWord"],
        nativeWord: json["nativeWord"],
        exp1: json["exp1"],
        exp2: json["exp2"],
        exp3: json["exp3"],
        exp4: json["exp4"],
        partofspeach: json["partofspeach"],
        lang: json["lang"],
        author: json["author"],
        editor: json["editor"],
        status: json["status"],
        dateAdded: json["date_added"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "englishWord": englishWord,
        "nativeWord": nativeWord,
        "exp1": exp1,
        "exp2": exp2,
        "exp3": exp3,
        "exp4": exp4,
        "partofspeach": partofspeach,
        "lang": lang,
        "author": author,
        "editor": editor,
        "status": status,
        "date_added": dateAdded,
      };
}
