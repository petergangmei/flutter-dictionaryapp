import 'dart:convert';

import 'package:http/http.dart';

import 'model/words_model.dart';

class WordRepository {
  String endpoint =
      'https://ruangmeidictionary.pythonanywhere.com/api/i34k2l34hs2-kdks35js4k-4dkskkkd64/';

  Future<List<WordModel>> getWords() async {
    Response response = await get(Uri.parse('${endpoint}recentAddedWord'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => WordModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<WordModel>> wordSearch(word) async {
    // ignore: prefer_interpolation_to_compose_strings
    Response response = await get(Uri.parse('${endpoint}englishSuggestions'+word));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => WordModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
