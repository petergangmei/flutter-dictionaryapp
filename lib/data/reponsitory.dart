import 'dart:convert';

import 'package:http/http.dart';

import 'model/words_model.dart';

class WordRepository {
  // /key/recent
  String endpoint =
      'http://dictionary.ruangmei.com/api/6KTFN-PQH9H-T8MMB-YG8K4-367TX/';

  Future<List<WordModel>> getWords() async {
    Response response = await get(Uri.parse('${endpoint}recent'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => WordModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<WordModel>> wordSearch(String word) async {
    Response response = await get(Uri.parse('${endpoint}keyword/' + word));
    if (response.statusCode == 200) {
      print('response 200');
      final List result = jsonDecode(response.body);
      return result.map((e) => WordModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
      print('error 0000');
    }
  }
}
