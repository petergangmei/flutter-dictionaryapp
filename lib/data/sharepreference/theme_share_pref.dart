import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharePreferences{
  static const PREF_KEY = "preference";

  setTheme(bool value) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PREF_KEY, value);
  }

  getTheme() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PREF_KEY)??false;
  }
}