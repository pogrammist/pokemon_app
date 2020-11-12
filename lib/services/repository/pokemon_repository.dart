import 'package:pokemon_app/logic/models/pokemon.dart';
import 'package:pokemon_app/services/api/pokemon_api.dart';

class PokemonRepository {
  PokemonApi api = PokemonApi();
  Future<Pokemon> getPokemon(String id) async {
    Pokemon pokemon = await api.fetchPokemon(id);
    return pokemon;
  }
}
