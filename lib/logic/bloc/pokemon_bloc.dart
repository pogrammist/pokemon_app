import 'dart:async';

import 'package:pokemon_app/logic/models/pokemon.dart';
import 'package:pokemon_app/services/repository/pokemon_repository.dart';

class PokemonBloc {
  PokemonRepository _repository = PokemonRepository();
  Pokemon _pokemon;

  final _inputEventController = StreamController<String>();
  StreamSink<String> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Pokemon>();
  Stream<Pokemon> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(String id) async {
    _pokemon = await _repository.getPokemon(id);
    _outputStateController.sink.add(_pokemon);
  }

  PokemonBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
