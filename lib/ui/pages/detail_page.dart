import 'package:flutter/material.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.e}) : super(key: key);
  final WordModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(e.englishWord)),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Container(
          color: Colors.white10,
          child: Column(children: [
            Row(
              children: [
                Text(
                  e.englishWord,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  e.wordType,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [Expanded(child: Text(e.m1))],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [Expanded(child: Text(e.m2 ?? ""))]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [Expanded(child: Text(e.m3 ?? ""))]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [Expanded(child: Text(e.m4 ?? ""))]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [Expanded(child: Text(e.m5 ?? ""))]),
            Row(
              children: const [Text('')],
            )
          ]),
        ),
      ),
    );
  }
}
