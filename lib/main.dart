import 'package:flutter/material.dart';
import 'package:ruangmei_dictionary/ui/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/reponsitory.dart';

void main() {
  runApp(const MyApp());
}

// http://ruangmeidictionary.pythonanywhere.com/api/i34k2l34hs2-kdks35js4k-4dkskkkd64

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => WordRepository(),
        child: HomePage(),
      ),
    );
  }
}
