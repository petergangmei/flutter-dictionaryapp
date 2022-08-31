import 'package:flutter/material.dart';
import 'package:ruangmei_dictionary/data/model/ThemeModel.dart';

import '../../data/themes/theme_manager.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});
  
  
  
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDdark = false;

  ThemeManager _themeManager = ThemeManager();
  ThemeModel _themeModel = ThemeModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('Setting')),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text('Theme Dark', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),),
                Switch(
                  value: _themeModel.isDark,
                  onChanged: (bool value) {
                    _themeManager.toggleTheme(value);
                    _themeModel.isDark = value;
                    print(_themeModel.isDark);
                    if(Get.isDarkMode){
                      Get.changeTheme(ThemeData.light());
                    }else {
                      Get.changeTheme(ThemeData.dark());
                    }
                    setState(() {
                      isDdark = value;
                    });
                  },
                ),
                ],)
              ],
            ),
          ),
        ),
    );
  }
}