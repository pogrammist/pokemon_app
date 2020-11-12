import 'package:flutter/material.dart';
import 'package:pokemon_app/services/api/pokemon.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final _myController = TextEditingController();
  Pokemon _pokemon;

  Future<void> setupPokemon(String id) async {
    Pokemon pokemon = Pokemon(id: id);
    await pokemon.fetchPokemon();
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
            _pokemon.image,
            height: 100,
          ),
        ],
      ),
    );
  }
}
