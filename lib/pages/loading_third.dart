import 'package:flutter/material.dart';
import 'package:pokemon_app/logic/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/logic/models/pokemon.dart';

class LoadingThird extends StatefulWidget {
  LoadingThird({Key key}) : super(key: key);

  @override
  _LoadingSecondState createState() => _LoadingSecondState();
}

class _LoadingSecondState extends State<LoadingThird> {
  final _myController = TextEditingController();
  final PokemonBloc _bloc = PokemonBloc();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        centerTitle: true,
      ),
      body: StreamBuilder<Pokemon>(
          stream: _bloc.outputStateStream,
          builder: (context, snapshot) {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    snapshot.data == null ? loading() : show(snapshot.data),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _myController,
                            ),
                          ),
                          SizedBox(width: 20),
                          RaisedButton(
                            child: Text('Pokemon'),
                            onPressed: () {
                              _myController.text.length != 0
                                  ? _bloc.inputEventSink.add(_myController.text)
                                  : null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  loading() {
    return Text('loading...');
  }

  show(Pokemon data) {
    return Container(
      child: Column(
        children: [
          Text(data.name),
          Image.network(
            data.sprites.frontDefault,
            height: 100,
          ),
        ],
      ),
    );
  }
}
