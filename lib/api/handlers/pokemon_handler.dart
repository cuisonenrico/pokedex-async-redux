import 'dart:convert';

import 'package:counter_async_redux/api/models/pokemon_response_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/utilities/constants.dart';
import 'package:http/http.dart' as http;

class PokemonHandler {
  static Future<PokemonResponse?> getPokemons(String? nextPage) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse(nextPage ?? pokemonUrl) ?? Uri());
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      List pokemonMap = decoded['results'];
      return PokemonResponse(
          next: decoded['next'],
          result: pokemonMap.map((e) => Pokemon.fromJson(e)).toList());
    } else {
      print('error');
      return null;
    }
  }
}
