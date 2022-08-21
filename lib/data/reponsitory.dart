import 'dart:convert';

import 'package:http/http.dart';

import 'model/words_model.dart';

class WordRepository {
  String endpoint =
      'https://ruangmeidictionary.pythonanywhere.com/api/i34k2l34hs2-kdks35js4k-4dkskkkd64/recentAddedWord';

  Future<List<WordModel>> getWords() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => WordModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
