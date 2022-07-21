import 'dart:convert';

import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/utilities/constants.dart';
import 'package:http/http.dart' as http;

class DetailsPokemonHandler {
  static Future<List<DetailsPokemon>?> getDetails(String? nextPage) async {
    List<DetailsPokemon>? addToList = [];
    var offset;
    var parsed = nextPage
        ?.replaceAll('https://pokeapi.co/api/v2/pokemon/?offset=', '')
        .split('&')[0];
    var response = http.Response('', 100);
    if (parsed != null) {
      offset = int.parse(parsed.toString());
    } else {
      offset = 0;
    }
    for (var i = 0; i < 20; i++) {
      try {
        response = await http.get(
            Uri.tryParse(pokemonDetailsUrl + (offset + 1).toString()) ?? Uri());
        offset = offset + 1;
      } catch (e) {
        print(e);
      }
      if (response.statusCode == 200) {
        addToList.add(DetailsPokemon.fromJson(jsonDecode(response.body)));
      } else {}
    }
    return addToList;
  }
}
