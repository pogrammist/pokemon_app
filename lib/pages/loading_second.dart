import 'package:flutter/material.dart';
import 'package:pokemon_app/logic/models/pokemon.dart';
import 'package:pokemon_app/services/repository/pokemon_repository.dart';

class LoadingSecond extends StatefulWidget {
  LoadingSecond({Key key}) : super(key: key);

  @override
  _LoadingSecondState createState() => _LoadingSecondState();
}

class _LoadingSecondState extends State<LoadingSecond> {
  final _myController = TextEditingController();
  PokemonRepository repository = PokemonRepository();
  Pokemon _pokemon;

  Future<void> setupPokemon(String id) async {
    Pokemon pokemon = await repository.getPokemon(id);
    setState(() {
      this._pokemon = pokemon;
      _myController.text = '';
    });
  }

  @override
  void initState() {
    super.initState();
    // setupPokemon('1');
  }

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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pokemon == null ? loading() : show(),
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
                            ? setupPokemon(_myController.text)
                            : null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  loading() {
    return Text('loading...');
  }

  show() {
    return Container(
      child: Column(
        children: [
          Text(_pokemon.name),
          Image.network(
            _pokemon.sprites.frontDefault,
            height: 100,
          ),
        ],
      ),
    );
  }
}
