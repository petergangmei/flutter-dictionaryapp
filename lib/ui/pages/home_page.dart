import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruangmei_dictionary/data/model/words_model.dart';
import 'package:ruangmei_dictionary/data/reponsitory.dart';
import 'package:ruangmei_dictionary/ui/pages/about_page.dart';
import 'package:ruangmei_dictionary/ui/pages/detail_page.dart';
import 'package:ruangmei_dictionary/ui/pages/setting_page.dart';

import '../../blocs/words_bloc/words_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      // print('--- $_controller.text');
      
    });

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
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.search),
          //     onPressed: () => showSearch(
          //       context: context,
          //       delegate: WordSearch(),
          //     ),
          //   ),
          // ],
        ),
        drawer: myDrawer(context),
        body: Column(
          children: [
            Container(
              color: Colors.blueGrey,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Word suggestion',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            loadWords(),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Recent added words',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            loadWords(),
          ],
        ),
      ),
    );
  }
}

loadSearchWords() {
  return Expanded(
    child: BlocBuilder<WordsBloc, WordsState>(
      builder: (context, state) {
        if (state is WordSearchingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WordSearchLoadedState) {
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
                          title: Text(wordList[index].nativeWord),
                          subtitle: Text(wordList[index].englishWord),
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

loadWords() {
  return Expanded(
    child: BlocBuilder<WordsBloc, WordsState>(
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
                          title: Text(wordList[index].nativeWord),
                          subtitle: Text(wordList[index].englishWord),
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
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Image.network(
                    'https://image.winudf.com/v2/image1/Y29tLnJvbmdtZWlkaWN0aW9uYXJ5LmJldGFfaWNvbl8xNjE2NzM5NjcwXzA0MQ/icon.png?w=184&fakeurl=1')),
            const SizedBox(
              height: 20,
            ),
            const Text('Ruangmei Dictionary'),
          ],
        ),
      ),
      const ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Profile'),
      ),
       ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  SettingPage(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.photo_album_outlined),
        title: const Text('About'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const AboutPage(),
          ));
        },
      ),
    ],
  ));
}
