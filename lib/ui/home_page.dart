import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';
import 'package:ruangmei_dictionary/data/reponsitory.dart';
import 'package:ruangmei_dictionary/ui/detail_page.dart';

import '../blocs/words_bloc/words_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordsBloc(
        RepositoryProvider.of<WordRepository>(context),
      )..add(LoadedWordEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ruangmei Dictionary'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<WordsBloc, WordsState>(
          builder: (context, state) {
            if (state is WordsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WordsLoadedState) {
              List<WordModel> wordList = state.words;
              return Container(
                padding: const EdgeInsets.all(10),
                child: Expanded(
                  child: ListView.builder(
                    itemCount: wordList.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Recent added words',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }
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
                                title: Text(wordList[index].nativeWord),
                                subtitle: Text(wordList[index].englishWord),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
