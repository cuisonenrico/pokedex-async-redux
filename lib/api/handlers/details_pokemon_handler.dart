import 'dart:convert';
import 'package:pokedex_async_redux/api/models/detailed_stat_model.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

class DetailsPokemonHandler {
  static Future<DetailsPokemon?> getDetails(String url) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse('$url') ?? Uri());
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      var endResponse = jsonDecode(response.body);
      List statMap = endResponse['stats'];
      List typeMap = endResponse['types'];
      return DetailsPokemon(
        id: endResponse['id'],
        name: endResponse['name'],
        stats: statMap.map((e) {
          return Stat(
            baseStat: e['base_stat'],
            stat: DetailedStat(
              name: e['stat']['name'],
              url: e['stat']['url'],
            ),
            effort: e['effort'],
          );
        }).toList(),
        types: typeMap.map((e) => SubType.fromJson(e)).toList(),
      );
    } else {
      print('error pokemon details');
      return null;
    }
  }
}
