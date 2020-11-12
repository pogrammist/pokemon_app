import 'dart:convert';

import 'package:http/http.dart';

class Pokemon {
  String id;
  String name;
  String image;

  Pokemon({this.id});

  Future<void> fetchPokemon() async {
    Response response = await get('https://pokeapi.co/api/v2/pokemon/$id');
    try {
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        name = (data['name']);
        image = (data['sprites']['front_default']);
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
