import 'dart:convert';
import 'package:counter_async_redux/api/models/detailsPokemon_model.dart';
import 'package:http/http.dart' as http;

class DetailsPokemonHandler {
  static Future<DetailsPokemon?> getDetails(String url) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse('$url') ?? Uri());
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      return DetailsPokemon.fromJson(jsonDecode(response.body));
    } else {
      print('error pokemon details');
      return null;
    }
  }
}
