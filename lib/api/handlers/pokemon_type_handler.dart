import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

class PokemonTypeHandler {
  static Future<List<SubType>?> getTypes(String url) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse('$url') ?? Uri());
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      var pokemonTypeResponse = jsonDecode(response.body);
      List pokemonTypeMap = pokemonTypeResponse['types'];
      return pokemonTypeMap.map((e) => SubType.fromJson(e)).toList();
    } else {
      print('error pokemon details');
      return null;
    }
  }
}
