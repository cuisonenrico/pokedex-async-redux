import 'dart:convert';

import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:counter_async_redux/api/models/pokemon_model.dart';
import 'package:counter_async_redux/utilities/constants.dart';
import 'package:http/http.dart' as http;

class PokemonHandler {
  static Future<List<Pokemon>?> getPokemons(String? nextPage) async {
    var response = http.Response('', 100);
    if (nextPage == null) {
      try {
        response = await http.get(Uri.tryParse(pokemonUrl) ?? Uri());
      } catch (e) {
        print(e);
      }
    } else {
      try {
        response = await http.get(Uri.tryParse(nextPage) ?? Uri());
      } catch (e) {
        print(e);
      }
    }

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<Pokemon>? addToList = [];
      data['results'].forEach((value) async {
        addToList.add(Pokemon.fromJson(jsonDecode(response.body)));
      });
      return addToList;
    } else {
      print("Can't get hatdog. Status Code: ${response.statusCode}");
      return null;
    }
  }

  static Future<String?> getNextPage(
    String? nextPage,
  ) async {
    var response = http.Response('', 100);
    if (nextPage.toString() == '0') {
      try {
        response = await http.get(Uri.tryParse(pokemonUrl) ?? Uri());
      } catch (e) {
        print(e);
      }
    } else {
      try {
        response = await http.get(Uri.tryParse(nextPage!) ?? Uri());
      } catch (e) {
        print(e);
      }
    }

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['next'];
    } else {
      print("Can't get next Page. Status Code: ${response.statusCode}");
      return null;
    }
  }
}
