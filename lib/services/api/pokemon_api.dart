import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokemon_app/logic/models/pokemon.dart';

class PokemonApi {
  Future<Pokemon> fetchPokemon(String id) async {
    Response response = await get('https://pokeapi.co/api/v2/pokemon/$id');
    // try {
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      print(response);
      print(data);
      return Pokemon.fromJson(data);
    } else {
      throw Exception('Error fetching pokemon');
    }
    // } catch (error) {
    //   print('Error: $error');
    // }
  }
}
