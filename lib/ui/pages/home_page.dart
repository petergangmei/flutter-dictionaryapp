import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';
import 'package:ruangmei_dictionary/data/reponsitory.dart';
import 'package:ruangmei_dictionary/ui/pages/detail_page.dart';

import '../../blocs/words_bloc/words_bloc.dart';
import '../components/app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final kyecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    kyecontroller.addListener(() {});

    return BlocProvider(
      create: (context) => WordsBloc(
        RepositoryProvider.of<WordRepository>(context),
      )..add(LoadedWordEvent()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text('Ruangmei Dictionary'),
            ],
          ),
          centerTitle: true,
        ),
        drawer: myDrawer(context),
        body: BlocBuilder<WordsBloc, WordsState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: ((value) =>
                              BlocProvider.of<WordsBloc>(context)
                                  .add(WordSearchEvent(kyecontroller.text))),
                          controller: kyecontroller,
                          style: const TextStyle(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Search',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //loard words -------------------------------
                loadWords(),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Load words -------------------------------------
loadWords() {
  return Expanded(
    child: BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        if (state is WordsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WordsLoadedErrorState) {
          return const Text('Loaded Error');
        }
        if (state is WordsLoadedState) {
          List<WordModel> wordList = state.words;
          return Container(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: wordList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          e: wordList[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.add),
                          title: Text(wordList[index].englishWord),
                          subtitle: Text(wordList[index].m1),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    ),
  );
}

myDrawer(BuildContext context) {
  return const AppDrawer();
}
