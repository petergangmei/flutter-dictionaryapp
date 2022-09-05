// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:ruangmei_dictionary/data/sharepreference/theme_share_pref.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemeSharePreferences themeSharePreferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    themeSharePreferences = ThemeSharePreferences();
    getThemePreference();
  }

  set isDark(bool value) {
    _isDark = value;
    themeSharePreferences.setTheme(value);
    // ignore: avoid_print
    print('printing from them model');
    notifyListeners();
  }

  getThemePreference() async {
    _isDark = await themeSharePreferences.getTheme();
    notifyListeners();
  }
}
