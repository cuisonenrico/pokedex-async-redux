import 'dart:convert';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:http/http.dart' as http;

class PokemonHandler {
  static Future<List<Pokemon>?> getPokemons() async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse(pokemonUrl) ?? Uri());
    } catch (e) {
      rethrow;
    }
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List pokemonMap = result['results'];
      return pokemonMap.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Pokemon>?> getFiltered(String filterKey) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse('$pokemonTypeUri$filterKey/') ?? Uri());
    } catch (e) {
      rethrow;
    }
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List filteredList = result['pokemon'];
      return filteredList
          .map((e) => Pokemon(
                name: e['pokemon']['name'],
                url: e['pokemon']['url'],
              ))
          .toList();
    } else {
      return null;
    }
  }
}
