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
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.grey[100],
          child: Column(children: [
            Row(
              children: [
                Text(
                  e.englishWord,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  e.nativeWord,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    e.exp1,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  e.exp2,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  e.exp3,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  e.exp4,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ]),
        ),
      ),
    );
  }
}
