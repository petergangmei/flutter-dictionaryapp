import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc_counters/counters_bloc.dart';

class SettingPage extends StatefulWidget {
  SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _inputName = TextEditingController();

  String _message = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CountersBloc(),
        child: Scaffold(
          appBar: AppBar(title: const Text('Setting')),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                BlocBuilder<CountersBloc, CountersState>(
                  builder: (context, state) {
                    if (state is CountersInitial) {
                      return const Text('loading');
                    }
                    if (state is CountersClickState) {
                      return const Text('click');
                    }
                    return Text('print -> ' + _message
                      ..toLowerCase());
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _inputName,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      hintText: 'Input your name',
                      border: const OutlineInputBorder(),
                      suffix: IconButton(
                        onPressed: () {
                          _inputName.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                      filled: true,
                      fillColor: Colors.white10),
                ),
                BlocBuilder<CountersBloc, CountersState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      child: const Text('Click me'),
                      onPressed: () {
                        BlocProvider.of<CountersBloc>(context).add(CountersClickState());
                        print('clic');
                        setState(() {
                          _message = _inputName.text;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
